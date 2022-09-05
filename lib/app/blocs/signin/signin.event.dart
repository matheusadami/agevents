abstract class SignInEvent {}

class SubmitFormSignInEvent extends SignInEvent {
  final String email;
  final String password;

  SubmitFormSignInEvent(this.email, this.password);
}
