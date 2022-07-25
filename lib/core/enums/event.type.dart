import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventType {
  personalEvent('Pessoal', AppColors.primary, FontAwesomeIcons.solidUser),
  studyEvent('Estudos', AppColors.secondary, FontAwesomeIcons.book),
  workEvent('Trabalho', AppColors.tertiary, FontAwesomeIcons.briefcase);

  final Color color;
  final String label;
  final IconData icon;

  const EventType(this.label, this.color, this.icon);
}
