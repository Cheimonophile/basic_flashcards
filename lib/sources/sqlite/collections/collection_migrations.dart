import 'dart:math';

import 'package:basic_flashcards/models/sqlite/migration.dart';

/// number of dummy decks to generate
const numDecks = 3;

/// number of dummy cards to generate
const numCards = 10;

final List<Migration> collectionMigrations = [
  /// First Version
  Migration(
    up: (txn) async {
      await txn.execute('''
        CREATE TABLE deck (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL
        );
      ''');
      await txn.execute('''
        CREATE TABLE card (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          deck_id INTEGER NOT NULL,
          front TEXT NOT NULL,
          back TEXT NOT NULL,
          score NUMERIC NOT NULL,
          FOREIGN KEY(deck_id) REFERENCES deck(id)
        );
      ''');
    },
    dummy: (txn) async {
      // insert decks
      final deckIds = List<int>.empty(growable: true);
      for (final i in List.generate(3, (i) => i)) {
        final id = await txn.insert('deck', {'name': 'deck $i'});
        deckIds.add(id);
      }

      // insert cards
      for (final deckId in deckIds) {
        for (final i in List.generate(numCards, (i) => i)) {
          await txn.insert('card', {
            'deck_id': deckId,
            'front': 'front $i',
            'back': 'back $i',
            'score': Random().nextDouble() * 100,
          });
        }
      }
    },
  )
];
