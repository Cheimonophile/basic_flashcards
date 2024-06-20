import 'package:basic_flashcards/sources/preferences.dart';
import 'package:basic_flashcards/sources/sqlite/collections/collection_dbs_dao.dart';
import 'package:basic_flashcards/models/collection.dart';

/// repo for interacting with collections
class CollectionsRepo {
  CollectionsRepo._();

  /// singleton instance
  static CollectionsRepo? _singleton;

  /// singleton factory
  factory CollectionsRepo() {
    _singleton ??= CollectionsRepo._();
    return _singleton!;
  }

  /// collection database dao
  final CollectionDbsDao collectionDbsDao = CollectionDbsDao();

  /// makes a new collection file and retuns the collection object
  Future<Collection?> create(String collectionPath) async {
    final collectionDb = await collectionDbsDao.create(collectionPath);
    if (collectionDb == null) {
      return null;
    }
    await Preferences.addCollectionPath(collectionPath);
    return Collection(collectionDb);
  }

  /// reads a collection from a collection path
  ///
  /// moves the collection to the ront of the list
  ///
  /// returns null if the collection doesn't exist
  Future<Collection?> read(String collectionPath) async {
    final collectionDb = await collectionDbsDao.read(collectionPath);

    // if the file doesn't exist
    if (collectionDb == null) {
      Preferences.removeCollectionPath(collectionPath);
      return null;
    }

    // if the file exists
    else {
      await Preferences.addCollectionPath(collectionPath);
      return Collection(collectionDb);
    }
  }

  /// reads the collections from the collection paths
  Future<List<Collection>> reads() async {
    final collectionPaths = await Preferences.collectionPaths;
    final collections = await Future.wait(
      collectionPaths.map(
        (path) => collectionDbsDao
            .read(path)
            .then((db) => db != null ? Collection(db) : null),
      ),
    );
    return collections.whereType<Collection>().toList();
  }

  /// deletes a collection from the collection path
  Future<void> delete(Collection collection) async {
    await collectionDbsDao.delete(collection.db);
    await Preferences.removeCollectionPath(collection.path);
  }
}
