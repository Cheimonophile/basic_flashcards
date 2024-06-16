


import 'package:shared_preferences/shared_preferences.dart';

sealed class Preferences {

  /// Get the dbUri of the sqlite database
  static Future<String?> get dbUri async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? dbUri = prefs.getString('dbUri');
    return dbUri;
  }

  /// Set the db uri
  static Future<bool> setDbUri(String? dbUri) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (dbUri == null) {
      return prefs.remove('dbUri');
    }
    else {
      return prefs.setString('dbUri', dbUri);
    }
  }

}