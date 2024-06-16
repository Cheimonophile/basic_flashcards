import 'dart:io';

/// Represents a single collection of cards
class Collection {
  final File _file;

  Collection(this._file);

  String get filePath => _file.path;

  String get fileName => _file.uri.pathSegments.last;
}
