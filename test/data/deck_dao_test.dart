import 'package:basic_flashcards/sources/sqlite/collections/collection_dbs_dao.dart';
import 'package:basic_flashcards/sources/sqlite/collections/decks/decks_dao.dart';
import 'package:basic_flashcards/utils/testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  allowDbInTests();
  group('Test DeckDao', () {
    test('Create Deck', () async {
      final db = await CollectionDbsDao().memory();
      final deckDao = DecksDao(db);
      final createdDeck = await deckDao.create(name: 'Deck 1');
      expect(createdDeck, isNotNull);
      db.close();
    });

    test('Read Deck that Exists', () async {
      final db = await CollectionDbsDao().memory();
      final deckDao = DecksDao(db);
      final createdDeck = await deckDao.create(name: 'Deck 1');
      final readDeck = await deckDao.read(createdDeck.id);
      expect(readDeck, isNotNull);
      db.close();
    });

    test('Read Deck that Does Not Exist', () async {
      final db = await CollectionDbsDao().memory();
      final deckDao = DecksDao(db);
      final readDeck = await deckDao.read(30);
      expect(readDeck, isNull);
      db.close();
    });

    test('Read Decks', () async {
      final db = await CollectionDbsDao().memory();
      final deckDao = DecksDao(db);
      await deckDao.create(name: 'Deck 1');
      await deckDao.create(name: 'Deck 2');
      final decks = await deckDao.reads();
      expect(decks.length, 2);
      db.close();
    });

    test("Update Deck", () async {
      final db = await CollectionDbsDao().memory();
      final deckDao = DecksDao(db);
      final deck = await deckDao.create(name: 'Deck 1');
      deck.name = 'Deck 2';
      await deckDao.update(deck);
      final updatedDeck = await deckDao.read(deck.id);
      expect(updatedDeck!.name, 'Deck 2');
      db.close();
    });

    test("Delete Deck", () async {
      final db = await CollectionDbsDao().memory();
      final deckDao = DecksDao(db);
      final deck = await deckDao.create(name: 'Deck 1');
      await deckDao.delete(deck);
      final deletedDeck = await deckDao.read(deck.id);
      expect(deletedDeck, isNull);
      db.close();
    });
  });
}
