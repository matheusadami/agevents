import 'dart:math';

import 'package:agevents/app/blocs/forgot-password/forgot-password.event.dart';
import 'package:agevents/app/blocs/forgot-password/forgot-password.state.dart';
import 'package:agevents/app/models/user.model.dart';
import 'package:agevents/app/repositories/forgot-password/interface.forgot.password.repository.dart';
import 'package:agevents/app/services/local.storage.service.dart';
import 'package:agevents/app/services/sms.service.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/helpers/permissions.helper.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  final String _keyNameUserId = 'keyUserId';
  final String _keyNameRecoverCode = 'keyRecoverCode';
  late final IForgotPasswordRepository repository;
  late final LocalStorageService lsService;

  ForgotPassBloc() : super(FirstStepForgotPassState()) {
    repository = NavigationService.context!.read<IForgotPasswordRepository>();
    lsService = NavigationService.context!.read<LocalStorageService>();

    on<SendSMSForgotPassEvent>(sendSMS);
    on<RecoveryCodeForgotPassEvent>(recoveryCode);
    on<ChangePasswordForgotPassEvent>(changePassword);
  }

  void sendSMS(SendSMSForgotPassEvent event, emit) async {
    try {
      emit(LoadingStepForgotPassState());

      final smsService = NavigationService.context!.read<SMSService>();

      final isAllGranted = [
        await PermissionHelper.sendSMSAskPermission(),
        await PermissionHelper.sendPhoneAskPermission(),
      ].every((e) => e);

      if (!isAllGranted) {
        return NavigationService.navigateToReplacement('/signin');
      }

      final data = await repository.getUserByPhone(event.toMap());
      if (data.isEmpty) {
        throw Exception('O número de telefone informado é inválido');
      }

      final user = UserModel.fromMap(data);

      final randomCode = List.generate(4, (_) => Random().nextInt(10));
      final message = 'Olá ${user.name}, seu código de recuperação de '
          'senha do AgEvents é ${randomCode.join()}.';

      await smsService.sendSMS(message, [event.phone]);

      await repository.saveRecoveryCode(_keyNameRecoverCode, randomCode.join());
      await repository.saveUserId(_keyNameUserId, user.id!);

      emit(SecondStepForgotPassState());
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FirstStepForgotPassState());
    }
  }

  void recoveryCode(RecoveryCodeForgotPassEvent event, Emitter emit) async {
    try {
      emit(LoadingStepForgotPassState());

      final userId = repository.getCurrentUserId(_keyNameUserId);
      final code = repository.getCurrentRecoveryCode(_keyNameRecoverCode);

      if (userId.isEmpty || code.isEmpty) {
        return NavigationService.navigateTo('/signin');
      }

      if (code == event.code) return emit(ThirdStepForgotPassState());

      throw CustomException('Código inválido. Tente novamente.');
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(SecondStepForgotPassState());
    }
  }

  void changePassword(ChangePasswordForgotPassEvent event, Emitter emit) async {
    try {
      emit(LoadingStepForgotPassState());

      if (event.password != event.confirmPassword) {
        throw CustomException('Por favor confirme sua senha corretamente');
      }

      if (event.password.isEmpty) {
        throw CustomException('Por favor informe uma senha');
      }

      if (event.password.length < 3) {
        throw CustomException('A senha deve conter ao menos 3 caracteres');
      }

      final userId = repository.getCurrentUserId(_keyNameUserId);
      final code = repository.getCurrentRecoveryCode(_keyNameRecoverCode);

      if (userId.isEmpty || code.isEmpty) {
        return NavigationService.navigateTo('/signin');
      }

      await repository.changePassword(event.password, userId);

      AlertsHelper.showSuccessSnackBar('Senha redefinida com sucesso');

      emit(FirstStepForgotPassState());
      NavigationService.navigateToReplacement('/signin');
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(ThirdStepForgotPassState());
    }
  }
}
