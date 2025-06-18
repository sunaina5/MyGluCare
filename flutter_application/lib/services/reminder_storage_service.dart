
import 'package:shared_preferences/shared_preferences.dart';


class ReminderStorage {

  static const _keyEnabled = 'isReminderEnabled';

  // Enable/disable reminder flag
  static Future<void> setReminderEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyEnabled, value);
  }

  static Future<bool> getReminderEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyEnabled) ?? false;
  }

 
}
