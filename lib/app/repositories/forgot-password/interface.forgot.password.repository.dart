import 'package:agevents/app/models/user.model.dart';

abstract class IForgotPasswordRepository {
  Future<UserModel?> getUserByPhone(String phone);
  String getCurrentRecoveryCode(String key);
  String getCurrentUserId(String key);
  Future<bool> saveRecoveryCode(String key, String value);
  Future<bool> saveUserId(String key, String value);
  Future<void> changePassword(String newPassword, String userId);
}
