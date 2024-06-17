import 'dart:io';

import 'package:basic_flashcards/sources/sqlite/collections/collection_migrations.dart';
import 'package:sqflite/sqflite.dart';

class CollectionDbDao {
  CollectionDbDao._();

  /// singleton instance
  static CollectionDbDao? _singleton;

  /// singleton factory
  factory CollectionDbDao() {
    _singleton ??= CollectionDbDao._();
    return _singleton!;
  }

  /// create a collection database
  Future<Database?> create(String path) async {
    final file = File(path);
    if (await file.exists()) {
      return null;
    } else {
      return _open(path);
    }
  }

  /// read (open) a collection database
  ///
  /// opens a connection to an existing database
  ///
  /// if the collection db doesn't exist, returns null
  ///
  /// rethrows any errors from file reading
  Future<Database?> read(String path) async {
    final file = File(path);
    if (await file.exists()) {
      return _open(path);
    } else {
      return null;
    }
  }

  /// delete a collection database
  ///
  /// if the file exists, tries to delete it. Rethrows exceptions from file reading
  ///
  /// if the file doesn't exist, does nothing
  Future<void> delete(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// open the database instance
  Future<Database> _open(String path) async {
    return openDatabase(
      path,
      version: collection_migrations.length,
      onCreate: (db, version) async {
        await db.transaction((txn) async {
          for (var i = 0; i < version; i++) {
            await collection_migrations[i].up(txn);
          }
        });
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.transaction((txn) async {
          for (var i = oldVersion; i < newVersion; i++) {
            await collection_migrations[i].up(txn);
          }
        });
      },
      singleInstance: true,
    );
  }
}
