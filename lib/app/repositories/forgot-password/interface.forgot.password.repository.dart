import 'package:agevents/app/models/user.model.dart';

abstract class IForgotPasswordRepository {
  Future<UserModel?> getUserByPhone(String phone);
  Future<String> getCurrentRecoveryCode();
  Future<void> changePassword(String newPassword);
}
