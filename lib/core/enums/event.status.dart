import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventStatus {
  pending(AppColors.tertiary, FontAwesomeIcons.spinner, 'Pendente'),
  doing(AppColors.primary, FontAwesomeIcons.spinner, 'Em andamento'),
  completed(AppColors.secondary, FontAwesomeIcons.spinner, 'Finalizado');

  const EventStatus(this.color, this.iconData, this.label);

  final Color color;
  final String label;
  final IconData iconData;
}
