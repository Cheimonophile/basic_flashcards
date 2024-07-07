import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';

part 'collection_db.g.dart';

const int version = 1;

/// Collection db datavase
@DriftDatabase(
  include: {'collection_db_migrations/$version.drift'},
)
class CollectionDb extends _$CollectionDb {
  CollectionDb(String filePath) : super(_openConnection(filePath));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          await customStatement('PRAGMA foreign_keys = ON');
          // migrator.runMigrationSteps(
          //   from: from,
          //   to: to,
          //   steps: migrationSteps(),
          // );
          if (kDebugMode) {
            final wrongForeignKeys =
                await customSelect('PRAGMA foreign_key_check').get();
            assert(wrongForeignKeys.isEmpty,
                '${wrongForeignKeys.map((e) => e.data)}');
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection(String filePath) {
  return LazyDatabase(() async {
    final file = File(filePath);
    return NativeDatabase.createInBackground(file);
  });
}
