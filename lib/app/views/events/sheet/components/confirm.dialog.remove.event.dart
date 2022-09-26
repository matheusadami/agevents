import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class ConfirmDialogRemoveEvent extends StatelessWidget {
  const ConfirmDialogRemoveEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Remover Evento',
        style: AppTextStyles.mediumDarkSemiBold,
      ),
      content: Text(
        'Tem certeza que deseja remover o evento?',
        style: AppTextStyles.verySmallDarkSemiBold,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop<bool>(context, true),
          child: Text(
            'Remover',
            style: AppTextStyles.verySmallPrimaryBold,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop<bool>(context, false),
          child: Text(
            'Cancelar',
            style: AppTextStyles.verySmallPrimaryBold,
          ),
        ),
      ],
    );
  }
}
