import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventStatus {
  pending(
    AppColors.tertiary,
    FontAwesomeIcons.solidClock,
    'Pendente',
  ),
  doing(
    AppColors.primary,
    FontAwesomeIcons.barsProgress,
    'Em andamento',
  ),
  completed(
    AppColors.secondary,
    FontAwesomeIcons.solidCircleCheck,
    'Finalizado',
  );

  const EventStatus(this.color, this.iconData, this.label);

  final Color color;
  final String label;
  final IconData iconData;
}
