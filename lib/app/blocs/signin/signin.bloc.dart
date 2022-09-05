import 'package:agevents/app/blocs/signin/signin.event.dart';
import 'package:agevents/app/blocs/signin/signin.state.dart';
import 'package:agevents/app/repositories/signin/interface.signin.repository.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late final ISignInRepository repository;

  SignInBloc() : super(FormSignInState()) {
    repository = NavigationService.context!.read<ISignInRepository>();

    on<SubmitFormSignInEvent>(signIn);
  }

  void signIn(SubmitFormSignInEvent event, Emitter emit) async {
    try {
      emit(LoadingSignInState());

      if (event.email.isEmpty || event.password.isEmpty) {
        throw CustomException('Por favor informe suas credenciais');
      }

      if (!await repository.signIn(event.email, event.password)) {
        throw CustomException('Credenciais inválidas');
      }

      NavigationService.navigateToReplacement('/home');
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormSignInState());
    }
  }
}
