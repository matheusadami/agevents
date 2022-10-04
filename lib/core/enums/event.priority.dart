import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventPriority {
  low(
    'Baixa',
    AppColors.white,
    AppColors.green,
    FontAwesomeIcons.caretDown,
  ),
  high(
    'Alta',
    AppColors.white,
    AppColors.red,
    FontAwesomeIcons.caretUp,
  );

  final Color color;
  final String label;
  final IconData icon;
  final Color colorLabel;

  const EventPriority(this.label, this.colorLabel, this.color, this.icon);
}
