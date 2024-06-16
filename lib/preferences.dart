import 'package:shared_preferences/shared_preferences.dart';

/// Get user preferences for the app
sealed class Preferences {
  /// The key for the collectionPaths in the user preferences
  static const String collectionPathsKey = 'collectionPaths';

  /// Gets the db uris from the prefs
  static List<String> _getCollectionPathsFromPrefs(SharedPreferences prefs) =>
      prefs.getStringList(collectionPathsKey) ?? [];

  /// Get the shared preferences
  static Future<SharedPreferences> get _prefs async =>
      SharedPreferences.getInstance();

  /// Get the collectionPath of the current collection
  static Future<String?> get collectionPath async {
    final SharedPreferences prefs = await _prefs;
    final List<String> collectionPaths = _getCollectionPathsFromPrefs(prefs);
    final String? collectionPath = collectionPaths.firstOrNull;
    return collectionPath;
  }

  /// Get the actively stored collectionPaths
  static Future<List<String>> get collectionPaths async {
    final SharedPreferences prefs = await _prefs;
    final List<String> collectionPaths = _getCollectionPathsFromPrefs(prefs);
    return collectionPaths;
  }

  /// add a collection path
  static Future<void> addCollectionPath(String collectionPath) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> collectionPaths = _getCollectionPathsFromPrefs(prefs);
    collectionPaths.remove(collectionPath);
    collectionPaths.insert(0, collectionPath);
    bool result =
        await prefs.setStringList(collectionPathsKey, collectionPaths);
    if (!result) {
      throw Exception('Failed to add collection path');
    }
  }

  /// Remove a collection path
  static Future<bool> removeCollectionPath(String collectionPath) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> collectionPaths = _getCollectionPathsFromPrefs(prefs);
    collectionPaths.remove(collectionPath);
    return prefs.setStringList(collectionPathsKey, collectionPaths);
  }
}
