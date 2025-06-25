// notification_storage.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/model/notifications/notification_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NotificationStorage {
  static String get _keyForCurrentUser {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("User not logged in");
    return 'notification_history_$uid';
  }

  static Future<void> saveNotificationHistory(List<NotificationHistory> history) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(history.map((h) => h.toJson()).toList());
    await prefs.setString(_keyForCurrentUser, jsonString);
  }

  static Future<List<NotificationHistory>> loadNotificationHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyForCurrentUser);
    if (jsonString == null) return [];

    final List<dynamic> list = jsonDecode(jsonString);
    return list.map((map) => NotificationHistory.fromJson(map)).toList();
  }

  static Future<void> addNotificationToHistory(NotificationHistory history) async {
    final existing = await loadNotificationHistory();
    existing.add(history);
    await saveNotificationHistory(existing);
  }
}