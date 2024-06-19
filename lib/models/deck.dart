typedef DeckId = int;

/// A deck of cards
class Deck {
  /// the deck's id
  ///
  /// if null, that means the deck doesn't exist in the database and was just created locally
  final DeckId? id;

  /// the deck's name
  String name;

  Deck({
    this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      other is Deck && other.id == id && other.name == name;

  @override
  int get hashCode => id ?? 0;

  /// represents the object as a string
  @override
  String toString() => 'Deck(id: $id, name: $name)';

  /// converts a map to the deck
  ///
  /// throws an ArgumentError if the map doesn't contain a particular value
  factory Deck.fromMap(Map<String, Object?> map) {
    // get the id from the map
    final id = map['id'];
    if (id is! int?) {
      throw ArgumentError('id must be an int?');
    }

    // get the name from the map
    final name = map['name'];
    if (name is! String) {
      throw ArgumentError('name must be a string');
    }

    // return the deck
    return Deck(
      id: id,
      name: name,
    );
  }

  /// converts the deck to a map
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
