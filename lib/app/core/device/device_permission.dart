import 'package:permission_handler/permission_handler.dart';

class DevicePermissions {
  Future<void> askForLocationAndStoragePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
  }
}
