import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> sendSMSAskPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) return true;

    return await Permission.sms.request().isGranted;
  }

  static Future<bool> sendPhoneAskPermission() async {
    if (await Permission.phone.status == PermissionStatus.granted) return true;

    return await Permission.phone.request().isGranted;
  }
}
