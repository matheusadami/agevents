import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventType {
  personalEvent('Pessoal', AppColors.yellow, FontAwesomeIcons.solidUser),
  studyEvent('Estudos', AppColors.blue, FontAwesomeIcons.book),
  workEvent('Trabalho', AppColors.darkBlue, FontAwesomeIcons.briefcase);

  final Color color;
  final String label;
  final IconData icon;

  const EventType(this.label, this.color, this.icon);
}
