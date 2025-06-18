import 'package:flutter/material.dart';
import 'package:flutter_application/model/notifications/notification_history.dart';
import 'package:flutter_application/services/notification_storage_service.dart';
import 'package:flutter_application/widgets/notification_tile.dart'; // 👈 Make sure this import is correct

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Future<List<NotificationHistory>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = NotificationStorage.loadNotificationHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Notification History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<NotificationHistory>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading history'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notification history available'));
          }

          final history = snapshot.data!;
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return NotificationTile(notification: history[index]);
            },
          );
        },
      ),
    );
  }
}
