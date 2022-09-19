import 'package:agevents/app/blocs/signin/signin.event.dart';
import 'package:agevents/app/blocs/signin/signin.state.dart';
import 'package:agevents/app/models/user.model.dart';
import 'package:agevents/app/repositories/signin/interface.signin.repository.dart';
import 'package:agevents/app/services/local.storage.service.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late final ISignInRepository repository;
  late final LocalStorageService lsService;
  late final AuthUserProvider authUserProvider;

  SignInBloc() : super(FormSignInState()) {
    authUserProvider = NavigationService.context!.read<AuthUserProvider>();
    repository = NavigationService.context!.read<ISignInRepository>();
    lsService = NavigationService.context!.read<LocalStorageService>();

    on<SubmitFormSignInEvent>(signIn);
  }

  void signIn(SubmitFormSignInEvent event, Emitter emit) async {
    try {
      emit(LoadingSignInState());

      final viewContext = Navigator.of(event.context);

      if (event.email.isEmpty || event.password.isEmpty) {
        throw CustomException('Por favor informe suas credenciais');
      }

      final data = await repository.signIn(event.toMap());

      if (data.containsKey('userId') && data.containsKey('token')) {
        final userData = await repository.getUserById(
          {'userId': data['userId']},
        );

        authUserProvider.setAuthUser(
          userModel: UserModel.fromMap(userData),
          token: data['token'],
        );

        emit(FormSignInState());
        viewContext.pushReplacementNamed('/home');
      } else {
        throw CustomException('Não foi possível entrar no sistema');
      }
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormSignInState());
    }
  }
}
