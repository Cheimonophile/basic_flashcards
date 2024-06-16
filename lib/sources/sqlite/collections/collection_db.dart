import 'package:basic_flashcards/sources/sqlite/collections/collection_migrations.dart';
import 'package:sqflite/sqflite.dart';

class CollectionDb {
  final Database db;

  CollectionDb._(this.db);

  /// opens a new instance of the collections database
  static Future<CollectionDb> open(String path) async {
    final db = await openDatabase(
      path,
      version: collection_migrations.length,
      // onConfigure: (txn) async {},
      onCreate: (db, version) async {
        for (var i = 0; i < version; i++) {
          await collection_migrations[i].up(db);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion; i < newVersion; i++) {
          await collection_migrations[i].up(db);
        }
      },
      // onDowngrade: (txn, oldVersion, newVersion) async => {},
      // onOpen: (txn) => {},
    );
    return CollectionDb._(db);
  }
}
