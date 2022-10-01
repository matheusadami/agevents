import 'package:agevents/app/models/user.model.dart';

class AuthUserProvider {
  UserModel? _userModel;
  String _token = '';

  bool get hasCurrentUser => _userModel != null && _token.isNotEmpty;

  String get firstUserName => _userModel!.name.split(" ").first;

  UserModel get currentUser => _userModel!;

  void setAuthUser({required UserModel userModel, required String token}) {
    _userModel = userModel;
    _token = _token;
  }

  void removeAuthUser() {
    _userModel = null;
    _token = '';
  }
}
