import 'package:permission_handler/permission_handler.dart';

class PermissionServices {
  static Future<void> checkPermissions() async {
    // Check notification permission
    PermissionStatus notificationStatus = await Permission.notification.status;
    if (notificationStatus.isDenied) {
      await Permission.notification.request();
    }

    // Check storage permission
    PermissionStatus storageStatus = await Permission.storage.status;
    if (storageStatus.isDenied) {
      await Permission.storage.request();
    }
  }
}