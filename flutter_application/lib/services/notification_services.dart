import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static final id = FirebaseAuth.instance.currentUser?.uid ?? 'default_user';
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final onClickNotifications = BehaviorSubject<String>();
  static void onNotificationsTap(NotificationResponse notificationResponse) {
    onClickNotifications.add(notificationResponse.payload!);
  }

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
        onDidReceiveNotificationResponse: (details) => null,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future cancelAllNotifications() async {
    flutterLocalNotificationsPlugin.cancelAll();
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
}