import 'package:basic_flashcards/models/collection.dart';
import 'package:basic_flashcards/models/deck.dart';
import 'package:basic_flashcards/repos/decks/decks_repo.dart';
import 'package:basic_flashcards/sources/sqlite/collections/decks/decks_dao.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'decks_event.dart';
part 'decks_state.dart';

class DecksBloc extends Bloc<DecksEvent, DecksState> {
  final DecksRepo _decksRepo;

  DecksBloc(Collection collection)
      : _decksRepo = DecksRepo(DecksDao(collection.db)),
        super(DecksLoading()) {
    on<DecksLoad>(_onDecksLoad);
    on<DecksCreate>(_onDecksCreate);
    on<DecksDelete>(_onDecksDelete);

    // initial load
    add(DecksLoad());
  }

  /// creates a deck
  Future<void> _onDecksCreate(
      DecksCreate event, Emitter<DecksState> emit) async {
    await _decksRepo.create(name: event.name);
    final decks = await _decksRepo.reads();
    emit(DecksLoaded(decks));
  }

  /// loads decks
  Future<void> _onDecksLoad(DecksLoad event, Emitter<DecksState> emit) async {
    final decks = await _decksRepo.reads();
    emit(DecksLoaded(decks));
  }

  /// deletes a deck
  Future<void> _onDecksDelete(
      DecksDelete event, Emitter<DecksState> emit) async {
    await _decksRepo.delete(event.deck);
    final decks = await _decksRepo.reads();
    emit(DecksLoaded(decks));
  }
}
