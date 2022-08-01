import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';

enum EventPriority {
  high('Alta', AppColors.white, AppColors.red),
  medium('Médio', AppColors.white, AppColors.dark),
  low('Baixa', AppColors.white, AppColors.secondary);

  final String label;
  final Color color;
  final Color colorLabel;

  const EventPriority(this.label, this.colorLabel, this.color);
}
