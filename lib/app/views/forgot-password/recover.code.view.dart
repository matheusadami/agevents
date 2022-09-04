import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RecoverCodeView extends StatelessWidget {
  RecoverCodeView({Key? key}) : super(key: key);

  final codeMask = MaskTextInputFormatter(
    mask: '#-#-#-#',
    type: MaskAutoCompletionType.eager,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Código de recuperação',
              style: AppTextStyles.bigPrimarySemiBold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Informe o código que você recebeu via SMS no campo abaixo',
            style: AppTextStyles.smallGraySemiBold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            width: size.width * 0.50,
            child: TextFormInputWidget(
              inputFormatters: [codeMask],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              hintText: '',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SizedBox(
            width: double.maxFinite,
            child: CommonButtonWidget(
              label: 'Verificar',
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
