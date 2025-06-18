import 'dart:convert';
import 'dart:developer';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application/model/notifications/notification_history.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/services/notification_storage_service.dart';
import 'package:flutter_application/utils/helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static final id = FirebaseAuth.instance.currentUser?.uid ?? 'default_user';
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final onClickNotifications = BehaviorSubject<String>();
  // static void onNotificationsTap(NotificationResponse notificationResponse) {
  //   onClickNotifications.add(notificationResponse.payload!);
  // }

  static Future init() async {
    try {
      // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
      
      );
      const LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(defaultActionName: 'Open notification');
      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsDarwin,
              linux: initializationSettingsLinux);
       flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onNotificationsTap,
        onDidReceiveBackgroundNotificationResponse: onBackgroundNotification,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future cancelAllNotifications() async {
    flutterLocalNotificationsPlugin.cancelAll();
  }
  // Handle background notifications (when app is not in foreground)
  @pragma('vm:entry-point')
  static void onBackgroundNotification(NotificationResponse notificationResponse) {
    // This runs in a separate isolate
    _handleNotification(notificationResponse);
  }

  // Handle foreground notifications
  static void onNotificationsTap(NotificationResponse notificationResponse) {
    _handleNotification(notificationResponse);
    onClickNotifications.add(notificationResponse.payload!);
  }
  static Future scheduleNotificattions(
      String title, String body, String payload, DateTime schedule) async {
     AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      id,
      'My Glucare',
      channelDescription: 'Reminder for your glucare monitoring',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
     NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(5, title, body,
        tz.TZDateTime.from(schedule, tz.local), notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: payload);
  }

  // show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  static Future scheduleInsulinCheckNotification(PredictionHistory prediction) async {
    if (prediction.next_insulin_check_suggested_at == null) return;

    final title = 'Insulin Check Reminder';
    final body = prediction.interpretation ?? 'Time to check your insulin levels';
    final payload = jsonEncode({
      'title': title,
      'body': body,
      'type': 'insulin_check',
      'prediction_id': prediction.id,
      'scheduled_time': prediction.next_insulin_check_suggested_at?.toIso8601String(),

    });
final nextDosageTitle = 'Next Insulin Dosage';
    final nextDosageBody = 'Your next insulin dosage is due at ${formatCheckedAt( prediction.next_dose)}';
    final nextDosagePayload = jsonEncode({
      'type': 'next_insulin_dosage',
      'prediction_id': prediction.id,
      'scheduled_time': prediction.next_dose?.toIso8601String(),
      'title': nextDosageTitle,
      'body': nextDosageBody,
    });
    await scheduleNotificattions(
      title,
      body,
      payload,
      prediction.next_insulin_check_suggested_at!,
    );
    await scheduleNotificattions(
      nextDosageTitle,
      nextDosageBody,
      nextDosagePayload,
      prediction.next_dose!,
    );
    // You might want to also save this as a scheduled notification
    // in your ReminderStorage if you want to track all scheduled notifications
  }

  static Future<void> _handleNotification(NotificationResponse response) async {
    log('Notification tapped: ${response.payload}');
  
  if (response.payload == null) return;

  try {
    final payload = jsonDecode(response.payload!);
    if (payload['type'] == 'insulin_check ' ||
        payload['type'] == 'next_insulin_dosage') {
      // Safely parse the DateTime
      final scheduledTime = payload['scheduled_time'] != null 
          ? DateTime.parse(payload['scheduled_time'])
          : DateTime.now();
   
      
      await _recordTriggeredNotification(
        title: payload['title'] ?? 'Insulin Check',
        body: payload['body'] ?? '',
        type: payload['type'] ?? 'insulin_check',
        scheduledTime: scheduledTime,
        predictionId: payload['prediction_id'],
      );
    }
  } catch (e) {
    debugPrint('Error handling notification: $e');
  }
}

 static Future _recordTriggeredNotification({
    required String title,
    required String body,
    required String type,
    required DateTime scheduledTime,
    String? predictionId,
  }) async {
    final history = NotificationHistory(
      title: title,
      body: body,
      type: type,
      scheduledTime: scheduledTime,
      triggeredTime: DateTime.now(),
      relatedPredictionId: predictionId,
    );
    
    await NotificationStorage.addNotificationToHistory(history);
  }

}