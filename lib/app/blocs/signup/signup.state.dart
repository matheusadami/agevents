abstract class SignUpState {}

class FormSignUpState extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class SuccessfullySignUpState extends SignUpState {}

class ExceptionSignUpState extends SignUpState {
  final String message;

  ExceptionSignUpState(this.message);
}
