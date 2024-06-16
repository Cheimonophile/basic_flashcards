import 'package:shared_preferences/shared_preferences.dart';

/// Get user preferences for the app
sealed class Preferences {
  /// The key for the dbUris in the user preferences
  static const String dbUrisKey = 'dbUris';

  /// Gets the db uris from the prefs
  static List<String> _getDbUrisFromPrefs(SharedPreferences prefs) =>
      prefs.getStringList(dbUrisKey) ?? [];

  /// Get the dbUri of the current collection
  static Future<String?> get dbUri async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> dbUris = _getDbUrisFromPrefs(prefs);
    final String? dbUri = dbUris.firstOrNull;
    return dbUri;
  }

  /// Get the actively stored dbUris
  static Future<List<String>> get dbUris async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> dbUris = _getDbUrisFromPrefs(prefs);
    return dbUris;
  }

  /// add a db uri
  static Future<bool> addDbUri(String dbUri) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> dbUris = _getDbUrisFromPrefs(prefs);
    dbUris.remove(dbUri);
    dbUris.insert(0, dbUri);
    return prefs.setStringList(dbUrisKey, dbUris);
  }
}
