import 'package:basic_flashcards/models/collection.dart';
import 'package:basic_flashcards/models/deck.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'decks_event.dart';
part 'decks_state.dart';

class DecksBloc extends Bloc<DecksEvent, DecksState> {
  DecksBloc(Collection collection) : super(LoadingDecksState());
}
