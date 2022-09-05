import 'package:agevents/app/models/user.model.dart';
import 'package:agevents/app/repositories/signup/interface.signup.repository.dart';

class SignUpRepository implements ISignUpRepository {
  @override
  Future<void> create(UserModel userModel) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUserByEmail(String email) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }
}
