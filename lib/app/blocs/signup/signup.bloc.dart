import 'package:agevents/app/blocs/signup/signup.event.dart';
import 'package:agevents/app/blocs/signup/signup.state.dart';
import 'package:agevents/app/repositories/signup/interface.signup.repository.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late final ISignUpRepository repository;

  SignUpBloc() : super(FormSignUpState()) {
    repository = NavigationService.context!.read<ISignUpRepository>();

    on<SubmitFormSignUpEvent>(submitForm);
  }

  void submitForm(SubmitFormSignUpEvent event, Emitter emit) async {}
}
