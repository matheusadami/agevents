import 'package:agevents/app/blocs/signup/signup.event.dart';
import 'package:agevents/app/blocs/signup/signup.state.dart';
import 'package:agevents/app/repositories/signup/interface.signup.repository.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late final ISignUpRepository repository;

  SignUpBloc() : super(FormSignUpState()) {
    repository = NavigationService.context!.read<ISignUpRepository>();

    on<SubmitFormSignUpEvent>(submitForm);
  }

  void submitForm(SubmitFormSignUpEvent event, Emitter emit) async {
    try {
      emit(LoadingSignUpState());

      if (event.name.isEmpty) {
        throw CustomException('Por favor informe seu nome');
      }

      if (event.email.isEmpty) {
        throw CustomException('Por favor informe seu e-mail');
      }

      if (event.password.length < 3) {
        throw CustomException('A senha deve conter ao menos 3 caracteres');
      }

      await repository.create(event.toMap());

      AlertsHelper.showSuccessSnackBar('Usuário criado com sucesso');
      emit(FormSignUpState());

      NavigationService.navigateToReplacement('/signin');
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormSignUpState());
    }
  }
}
