import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventType {
  personalEvent(1, 'Pessoal', AppColors.purple, FontAwesomeIcons.solidUser),
  studyEvent(2, 'Estudos', AppColors.blue, FontAwesomeIcons.book),
  workEvent(3, 'Trabalho', AppColors.darkBlue, FontAwesomeIcons.briefcase);

  final int value;
  final Color color;
  final String label;
  final IconData icon;

  const EventType(this.value, this.label, this.color, this.icon);
}
