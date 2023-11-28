


import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToSharedPreference(String key, dynamic value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (value is String) {
    preferences.setString(key, value);
  } else if (value is bool) {
    preferences.setBool(key, value);
  } else if (value is double) {
    preferences.setDouble(key, value);
  } else if (value is int) {
    preferences.setInt(key, value);
  } else if (value is List<String>) {
    preferences.setStringList(key, value);
  }
}

Future<bool?> getFromSharedPreference(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool(key);
}

Future<bool> deleteFromSharedPreference(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.remove(key);
}
