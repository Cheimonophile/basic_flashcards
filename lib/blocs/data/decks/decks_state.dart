part of 'decks_bloc.dart';

abstract class DecksState {}

class DecksLoading extends DecksState {}

class DecksLoadingFailed extends DecksState {
  final Exception exception;

  DecksLoadingFailed(this.exception);
}

class DecksLoaded extends DecksState {
  final List<Deck> _decks;

  DecksLoaded(this._decks);

  List<Deck> get decks => List.unmodifiable(_decks);
}
