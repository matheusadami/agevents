import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextFormInputWidget(
            hintText: 'Nova Senha',
            icon: FontAwesomeIcons.asterisk,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextFormInputWidget(
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
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
