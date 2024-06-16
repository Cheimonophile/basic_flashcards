import 'package:sqflite/sqflite.dart';

/// object represents a database migration
class Migration {
  /// function to run when migrating up
  Future<void> Function(DatabaseExecutor txn) up;

  /// function to run to insert dummy data
  Future<void> Function(DatabaseExecutor txn) dummy;

  Migration({required this.up, required this.dummy});
}
