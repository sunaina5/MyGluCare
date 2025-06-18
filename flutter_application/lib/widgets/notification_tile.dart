import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/model/notifications/notification_history.dart';

class NotificationTile extends StatelessWidget {
  final NotificationHistory notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final time = notification.triggeredTime ?? notification.scheduledTime;
    final formattedTime = time != null
        ? DateFormat('MMM d, y • h:mm a').format(time)
        : 'No time available';

    IconData icon;
    switch (notification.type) {
      case 'insulin_check':
        icon = Icons.healing;
        break;
      case 'glucose_reminder':
        icon = Icons.bloodtype;
        break;
      case 'next_insulin_dosage':
        icon = Icons.medical_services;
        break;
      default:
        icon = Icons.notifications_none;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          notification.title ?? 'No Title',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body ?? 'No description'),
            const SizedBox(height: 4),
            Text(
              formattedTime,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
       // trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Optional: handle tap event
        },
      ),
    );
  }
}
