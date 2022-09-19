abstract class ForgotPassEvent {}

class SendSMSForgotPassEvent extends ForgotPassEvent {
  final String phone;

  SendSMSForgotPassEvent(this.phone);

  Map<String, String> toMap() {
    return {
      'phone': phone,
    };
  }
}

class RecoveryCodeForgotPassEvent extends ForgotPassEvent {
  final String code;

  RecoveryCodeForgotPassEvent(this.code);
}

class ChangePasswordForgotPassEvent extends ForgotPassEvent {
  final String password;
  final String confirmPassword;

  ChangePasswordForgotPassEvent(this.password, this.confirmPassword);

  Map<String, String> toMap() {
    return {
      'password': password,
    };
  }
}
