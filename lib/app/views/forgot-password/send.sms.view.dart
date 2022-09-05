import 'package:agevents/app/blocs/forgot-password/forgot-password.bloc.dart';
import 'package:agevents/app/blocs/forgot-password/forgot-password.event.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SendSMSView extends StatelessWidget {
  SendSMSView({Key? key}) : super(key: key);

  final phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    type: MaskAutoCompletionType.eager,
  );

  void onTapSendSMS(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (phoneMask.isFill()) {
      final sendSMSEvent = SendSMSForgotPassEvent(phoneMask.getUnmaskedText());
      return BlocProvider.of<ForgotPassBloc>(context).add(sendSMSEvent);
    }

    AlertsHelper.showWarnSnackBar(
      'Por favor preencha as informações corretamente',
    );
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
              'Recuperar senha',
              style: AppTextStyles.bigPrimarySemiBold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Enviaremos um SMS para o número de celular informado abaixo',
            style: AppTextStyles.smallGraySemiBold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormInputWidget(
            inputFormatters: [phoneMask],
            keyboardType: TextInputType.number,
            hintText: 'Celular',
            icon: FontAwesomeIcons.phone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: double.maxFinite,
            child: CommonButtonWidget(
              label: 'Enviar SMS',
              onTap: () => onTapSendSMS(context),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: double.maxFinite,
            child: CommonButtonWidget(
              backgroundColor: AppColors.darkGray,
              label: 'Voltar',
              onTap: () => NavigationService.pop(),
            ),
          ),
        ),
      ],
    );
  }
}
