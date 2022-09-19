abstract class IForgotPasswordRepository {
  Future<Map<String, dynamic>> getUserByPhone(Map<String, String> variables);
  String getCurrentRecoveryCode(String key);
  String getCurrentUserId(String key);
  Future<bool> saveRecoveryCode(String key, String value);
  Future<bool> saveUserId(String key, String value);
  Future<bool> changePassword(String newPassword, String userId);
}
