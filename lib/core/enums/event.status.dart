import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventStatus {
  pending(
    1,
    AppColors.tertiary,
    FontAwesomeIcons.solidClock,
    'Pendente',
  ),
  doing(
    2,
    AppColors.primary,
    FontAwesomeIcons.barsProgress,
    'Em andamento',
  ),
  completed(
    3,
    AppColors.secondary,
    FontAwesomeIcons.solidCircleCheck,
    'Finalizado',
  );

  const EventStatus(this.value, this.color, this.iconData, this.label);

  final int value;
  final Color color;
  final String label;
  final IconData iconData;
}
