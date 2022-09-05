import 'package:agevents/app/models/user.model.dart';
import 'package:agevents/app/repositories/forgot-password/interface.forgot.password.repository.dart';
import 'package:agevents/app/services/local.storage.service.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:provider/provider.dart';

class FotgotPasswordRepository implements IForgotPasswordRepository {
  @override
  Future<void> changePassword(String newPassword, String userId) async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  String getCurrentRecoveryCode(String key) {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return shared.getString(key: key);
  }

  @override
  String getCurrentUserId(String key) {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return shared.getString(key: key);
  }

  @override
  Future<UserModel?> getUserByPhone(String phone) async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<bool> saveRecoveryCode(String key, String value) async {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return await shared.saveString(
      key: key,
      value: value,
    );
  }

  @override
  Future<bool> saveUserId(String key, String value) async {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return await shared.saveString(
      key: key,
      value: value,
    );
  }
}
