import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class FilterEventsDialog extends StatelessWidget {
  const FilterEventsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filtros',
        style: AppTextStyles.mediumDarkSemiBold,
      ),
      content: Column(
        children: const [],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
