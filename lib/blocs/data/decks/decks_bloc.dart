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

        }
}
