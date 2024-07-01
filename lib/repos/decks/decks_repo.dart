import 'package:basic_flashcards/models/deck.dart';
import 'package:basic_flashcards/sources/sqlite/collections/decks/decks_dao.dart';

/// repo for interacting with decks
class DecksRepo {
  final DecksDao _decksDao;

  DecksRepo(this._decksDao);

  /// creates a deck in the database
  Future<Deck> create({required String name}) async =>
      await _decksDao.create(name: name);

  /// reads a deck from the database
  Future<Deck?> read(DeckId id) async => await _decksDao.read(id);

  /// reads decks from the database
  Future<List<Deck>> reads() async => await _decksDao.reads();

  /// updates a deck in the database
  Future<void> update(Deck deck) async => await _decksDao.update(deck);

  /// deletes a deck from the database
  Future<void> delete(Deck deck) async => await _decksDao.delete(deck);
}
