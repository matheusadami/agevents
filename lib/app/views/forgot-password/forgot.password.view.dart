import 'package:agevents/app/blocs/forgot-password/forgot-password.bloc.dart';
import 'package:agevents/app/blocs/forgot-password/forgot-password.state.dart';
import 'package:agevents/app/views/forgot-password/change.password.view.dart';
import 'package:agevents/app/views/forgot-password/recovery.code.view.dart';
import 'package:agevents/app/views/forgot-password/send.sms.view.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  List<Step> getSteps(ForgotPassState state) {
    return [
      Step(
        title: const Text(''),
        state: getCurrentStepState(state, 0),
        content: SendSMSView(),
        isActive: isStepActive(getCurrentStepState(state, 0)),
      ),
      Step(
        title: const Text(''),
        state: getCurrentStepState(state, 1),
        content: RecoveryCodeView(),
        isActive: isStepActive(getCurrentStepState(state, 1)),
      ),
      Step(
        title: const Text(''),
        state: getCurrentStepState(state, 2),
        content: ChangePasswordView(),
        isActive: isStepActive(getCurrentStepState(state, 2)),
      ),
    ];
  }

  StepState getCurrentStepState(ForgotPassState state, int currentStep) {
    return state.stepIndex > currentStep
        ? StepState.complete
        : StepState.indexed;
  }

  bool isStepActive(StepState stepState) {
    return stepState.index == StepState.indexed.index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPassBloc>(
      create: (context) => ForgotPassBloc(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.background,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: BlocConsumer<ForgotPassBloc, ForgotPassState>(
              listener: (context, state) {
                if (state is CompletedAllStepsForgotPassState) {}
              },
              builder: (context, state) {
                if (state is LoadingStepForgotPassState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Stepper(
                  currentStep: state.stepIndex,
                  controlsBuilder: (context, details) => Container(),
                  type: StepperType.horizontal,
                  steps: getSteps(state),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
