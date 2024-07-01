part of 'decks_bloc.dart';

abstract class DecksEvent {}

class DecksLoad extends DecksEvent {}

class DecksCreate extends DecksEvent {
  final String name;

  DecksCreate({required this.name});
}

class DecksUpdate extends DecksEvent {
  final Deck deck;

  DecksUpdate(this.deck);
}

class DecksDelete extends DecksEvent {
  final Deck deck;

  DecksDelete(this.deck);
}
