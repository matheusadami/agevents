import 'package:agevents/app/blocs/forgot-password/forgot-password.bloc.dart';
import 'package:agevents/app/blocs/forgot-password/forgot-password.event.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({Key? key}) : super(key: key);

  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void onTapChangePassword(BuildContext context) {
    try {
      FocusManager.instance.primaryFocus?.unfocus();

      final changePasswordEvent = ChangePasswordForgotPassEvent(
        passController.text,
        confirmPassController.text,
      );
      return BlocProvider.of<ForgotPassBloc>(context).add(changePasswordEvent);
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Redefinir senha',
              style: AppTextStyles.bigPrimarySemiBold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Informe e confirme sua nova senha',
            style: AppTextStyles.smallGraySemiBold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormInputWidget(
            isObscureText: true,
            controller: passController,
            hintText: 'Nova Senha',
            icon: FontAwesomeIcons.asterisk,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormInputWidget(
            isObscureText: true,
            controller: confirmPassController,
            hintText: 'Confirmar Nova Senha',
            icon: FontAwesomeIcons.asterisk,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SizedBox(
            width: double.maxFinite,
            child: CommonButtonWidget(
              label: 'Confirmar',
              onTap: () => onTapChangePassword(context),
            ),
          ),
        ),
      ],
    );
  }
}
