import 'dart:io';

import 'package:basic_flashcards/preferences.dart';
import 'package:basic_flashcards/types/data/collection.dart';

class CollectionsRepo {
  static CollectionsRepo? _internal;

  factory CollectionsRepo() {
    _internal ??= CollectionsRepo._();
    return _internal!;
  }

  CollectionsRepo._();

  /// makes a new collection file and retuns the collection object
  Future<Collection> createCollection(String collectionPath) async {
    final file = File(collectionPath);
    await file.create();
    await Preferences.addCollectionPath(collectionPath);
    return Collection(collectionPath);
  }

  /// reads the collections from the collection paths
  Future<List<Collection>> readCollections() async {
    final collectionPaths = await Preferences.collectionPaths;
    final collections =
        collectionPaths.map((path) => Collection(path)).toList();
    return collections;
  }

  /// reads a collection from a collection path
  ///
  /// moves the collection to the ront of the list
  /// 
  /// returns null if the collection doesn't exist
  Future<Collection?> readCollection(String collectionPath) async {
    final collectionFile = File(collectionPath);
    final exists = await collectionFile.exists();

    // if the file doesn't exist
    if (!exists) {
      Preferences.removeCollectionPath(collectionPath);
      return null;
    }

    // if the file exists
    else {
      await Preferences.addCollectionPath(collectionPath);
      return Collection(collectionPath);
    }
  }
}
