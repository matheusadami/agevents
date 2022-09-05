import 'package:agevents/app/models/user.model.dart';
import 'package:agevents/app/repositories/forgot-password/interface.forgot.password.repository.dart';

class FotgotPasswordRepository implements IForgotPasswordRepository {
  @override
  Future<void> changePassword(String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentRecoveryCode() {
    // TODO: implement getCurrentRecoveryCode
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUserByPhone(String phone) {
    // TODO: implement getUserByPhone
    throw UnimplementedError();
  }
}
