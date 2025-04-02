import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  /// Request necessary permissions (Camera, Gallery, Notification)
  static Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
      Permission.notification,
    ].request();

    // Log statuses
    statuses.forEach((permission, status) {
      if (status.isGranted) {
        print("${permission.toString()} granted");
      } else if (status.isDenied) {
        print("${permission.toString()} denied");
      } else if (status.isPermanentlyDenied) {
        print("${permission.toString()} permanently denied");
        // Optionally, open app settings for permissions
        openAppSettings();
      }
    });
  }
}
