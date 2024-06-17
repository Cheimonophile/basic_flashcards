import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/types/data/deck.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'decks_event.dart';
part 'decks_state.dart';

class DecksBloc extends Bloc<DecksEvent, DecksState> {
  DecksBloc(Collection collection) : super(LoadingDecksState());
}
