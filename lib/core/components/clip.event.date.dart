import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClipEventDate extends StatelessWidget {
  const ClipEventDate({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            FontAwesomeIcons.solidCalendarCheck,
            size: 16,
            color: AppColors.darkGray,
          ),
        ),
        Text(
          eventModel.date,
          style: AppTextStyles.verySmallDarGraykSemiBold,
        ),
      ],
    );
  }
}
