import 'package:agevents/app/models/user.model.dart';

abstract class ISignUpRepository {
  Future<UserModel?> getUserByEmail(String email);
  Future<void> create(UserModel userModel);
}
