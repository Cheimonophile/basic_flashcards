import 'dart:io';

import 'package:sqflite/sqflite.dart';

/// Represents a single collection of cards
class Collection {
  final Database db;

  Collection(this.db);

  String get path => db.path;

  String get fileName => File(db.path).uri.pathSegments.last;
}
