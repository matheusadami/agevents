import 'package:flutter/cupertino.dart';

abstract class SignInEvent {}

class SubmitFormSignInEvent extends SignInEvent {
  final String email;
  final String password;
  final BuildContext context;

  SubmitFormSignInEvent(this.email, this.password, this.context);

  Map<String, String> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
