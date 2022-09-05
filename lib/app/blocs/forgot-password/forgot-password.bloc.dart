import 'dart:math';

import 'package:agevents/app/blocs/forgot-password/forgot-password.event.dart';
import 'package:agevents/app/blocs/forgot-password/forgot-password.state.dart';
import 'package:agevents/app/repositories/forgot-password/interface.forgot.password.repository.dart';
import 'package:agevents/app/services/sms.service.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/permissions.helper.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  late final IForgotPasswordRepository repository;

  ForgotPassBloc() : super(FirstStepForgotPassState()) {
    repository = NavigationService.context!.read<IForgotPasswordRepository>();

    on<SendSMSForgotPassEvent>(sendSMS);
  }

  dynamic sendSMS(SendSMSForgotPassEvent event, emit) async {
    try {
      emit(LoadingStepForgotPassState());

      final currentContext = NavigationService.context!.read<SMSService>();
      final isGranted = [
        await PermissionHelper.sendSMSAskPermission(),
        await PermissionHelper.sendPhoneAskPermission(),
      ].every((e) => e);

      if (!isGranted) {
        return await NavigationService.navigateToReplacement('/signin');
      }

      /*
      final user = await repository.getUserByPhone(event.phone);
      if (user == null) {
        throw Exception('O número de telefone informado é inválido');
      }
      */

      final randomCode = List.generate(4, (_) => Random().nextInt(10));
      final message =
          "Olá Matheus, seu código de recuperação de senha do AgEvents é ${randomCode.join()}.";

      await currentContext.sendSMS(message, [event.phone]);

      emit(SecondStepForgotPassState());
    } catch (e) {
      AlertsHelper.showWarnSnackBar(e.toString());
      emit(FirstStepForgotPassState());
    }
  }
}
