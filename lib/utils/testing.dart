import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void allowDbInTests() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}
