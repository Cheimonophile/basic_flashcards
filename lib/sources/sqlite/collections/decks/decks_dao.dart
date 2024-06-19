import 'package:basic_flashcards/models/deck.dart';
import 'package:sqflite/sqflite.dart';

/// Data Access Object for Decks from a sqlite database
class DecksDao {
  /// table name for the decks table
  static const table = 'decks';

  /// database instance
  final Database _db;

  DecksDao(this._db);

  /// creates a deck in the database
  ///
  /// if the deck already exists, returns null
  ///
  /// throws an ArgumentError if the deck has an id
  ///
  /// returns the deck if it was created
  Future<Deck?> create(Deck deck) async {
    if (deck.id != null) {
      throw ArgumentError('deck must not have an id to be created');
    }
    final id = await _db.transaction((txn) async {
      return await txn.insert(
        table,
        deck.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    });
    final newDeck = await read(id);
    return newDeck;
  }

  /// creates a deck in the database
  ///
  /// if the deck doesnt exist, returns null
  Future<Deck?> read(DeckId id) async {
    try {
      final deck = await _db.transaction((txn) async {
        final result = await _db.query(
          table,
          where: 'id = ?',
          whereArgs: [id],
        );
      });

      // return Deck(
      //   id: result[0]['id'],
      //   name: result[0]['name'],
      // );
    } on IndexError catch (_) {
      return null;
    }
  }
}
