import 'package:basic_flashcards/sources/sqlite/collections/collection_migrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // make sure tests will work
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('Test CollectionsDb Migrations', () {
    final currentVersion = collection_migrations.length;

    // test migrations from each version to the current
    for (var version = 1; version < currentVersion + 1; version++) {
      // test migration from version to version
      test('Migrate from Version $version to $currentVersion', () async {
        final db = await openDatabase(
          'file:memdb$version?mode=memory&cache=shared',
          version: version,
          onCreate: (db, version) async {
            await db.transaction((txn) async {
              for (var i = 1; i <= version; i++) {
                await collection_migrations[i - 1].up(txn);
              }
            });
          },
          onUpgrade: (db, oldVersion, newVersion) async {
            await db.transaction((txn) async {
              for (var i = oldVersion + 1; i <= newVersion; i++) {
                await collection_migrations[i - 1].up(txn);
              }
            });
          },
        );

        // add dummy data
        await collection_migrations[version - 1].dummy(db);

        // migrate to the current version
        for (var upVersion = version + 1;
            upVersion <= currentVersion;
            upVersion++) {
          await collection_migrations[upVersion - 1].up(db);
        }
        expect(await db.getVersion(), currentVersion);
      });
    }
  });
}
