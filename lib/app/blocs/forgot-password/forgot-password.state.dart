abstract class ForgotPassState {
  final int stepIndex;

  ForgotPassState({this.stepIndex = -1});
}

class FirstStepForgotPassState extends ForgotPassState {
  FirstStepForgotPassState({super.stepIndex = 0});
}

class SecondStepForgotPassState extends ForgotPassState {
  SecondStepForgotPassState({super.stepIndex = 1});
}

class ThirdStepForgotPassState extends ForgotPassState {
  ThirdStepForgotPassState({super.stepIndex = 2});
}

class CompletedAllStepsForgotPassState extends ForgotPassState {
  CompletedAllStepsForgotPassState({super.stepIndex = 2});
}
