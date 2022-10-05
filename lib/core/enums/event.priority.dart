import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventPriority {
  low(1, 'Baixa', AppColors.white, AppColors.green, FontAwesomeIcons.caretDown),
  high(2, 'Alta', AppColors.white, AppColors.red, FontAwesomeIcons.caretUp);

  final int value;
  final Color color;
  final String label;
  final IconData icon;
  final Color colorLabel;

  const EventPriority(
    this.value,
    this.label,
    this.colorLabel,
    this.color,
    this.icon,
  );
}
