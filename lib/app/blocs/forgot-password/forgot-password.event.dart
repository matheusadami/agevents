abstract class ForgotPassEvent {}

class SendSMSForgotPassEvent extends ForgotPassEvent {
  final String phone;

  SendSMSForgotPassEvent(this.phone);
}

class RecoveryCodeForgotPassEvent extends ForgotPassEvent {
  final String code;

  RecoveryCodeForgotPassEvent(this.code);
}

class ChangePasswordForgotPassEvent extends ForgotPassEvent {}
