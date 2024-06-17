part of 'decks_bloc.dart';

abstract class DecksState {}

class LoadingDecksState extends DecksState {}

class ErrorDecksState extends DecksState {
  final String message;

  ErrorDecksState(this.message);
}

class LoadedDecksState extends DecksState {
  final List<Deck> _decks;

  LoadedDecksState(this._decks);

  List<Deck> get decks => List.unmodifiable(_decks);
}
