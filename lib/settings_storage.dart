import 'package:shared_preferences/shared_preferences.dart';

class SettingsStorage {
  Future<void> saveSetting(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> loadSetting(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? 'Default Value';
  }
}
