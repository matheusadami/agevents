import 'package:agevents/app/blocs/forgot-password/forgot-password.event.dart';
import 'package:agevents/app/blocs/forgot-password/forgot-password.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc() : super(FirstStepForgotPassState());
}
