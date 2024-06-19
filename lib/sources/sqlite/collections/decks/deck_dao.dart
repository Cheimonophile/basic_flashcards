import 'package:basic_flashcards/models/deck.dart';
import 'package:sqflite/sqflite.dart';

/// Data Access Object for Decks from a sqlite database
class DeckDao {
  /// table name for the decks table
  static const table = 'deck';

  /// database instance
  final Database _db;

  DeckDao(this._db);

  /// creates a deck in the database
  ///
  /// throws an ArgumentError if the deck has an id
  ///
  /// returns the deck if it was created
  Future<Deck> create({required String name}) async {
    final result = await _db.transaction((txn) async {
      return await txn
          .rawQuery("INSERT INTO $table VALUES (NULL, ?) RETURNING *", [name]);
    });
    final newDeck = Deck.fromMap(result[0]);
    return newDeck;
  }

  /// creates a deck in the database
  ///
  /// if the deck doesnt exist, returns null
  Future<Deck?> read(DeckId id) async {
    try {
      final result = await _db.transaction((txn) async {
        return await txn.query(
          table,
          where: 'id = ?',
          whereArgs: [id],
        );
      });
      final deck = Deck.fromMap(result[0]);
      return deck;
    } on RangeError catch (_) {
      return null;
    }
  }

  /// updates a deck in the database
  Future<void> update(Deck deck) async {
    await _db.transaction((txn) async {
      await txn.update(
        table,
        deck.toMap(),
        where: 'id = ?',
        whereArgs: [deck.id],
      );
    });
  }

  /// deletes a deck from the database
  Future<void> delete(Deck deck) async {
    await _db.transaction((txn) async {
      await txn.delete(
        table,
        where: 'id = ?',
        whereArgs: [deck.id],
      );
    });
  }
}
