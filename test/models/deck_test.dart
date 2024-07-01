import 'package:basic_flashcards/models/deck.dart';
import 'package:flutter_test/flutter_test.dart';

const numTestsPerObject = 3;

void main() {
  group('Deck', () {
    // create a list of decks
    final decks = [
      for (final id in [1])
        for (final name in ['deck name']) Deck(id, name: name)
    ];
    for (final deck in decks) {
      test('Mappable $deck', () {
        // Convert the Deck object to a map
        final deck2 = Deck.fromMap(deck.toMap());
        final deck3 = Deck.fromMap(deck2.toMap());

        // Assert that the map has the correct values
        expect(deck3.id, deck.id);
        expect(deck3.name, deck.name);
      });
    }
  });
}
