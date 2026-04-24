import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  Future<void> saveData(String key, List data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(data));
  }

  Future<List?> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);
    return data != null ? jsonDecode(data) : null;
  }
}
