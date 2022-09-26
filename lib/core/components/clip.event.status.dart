import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class ClipEventStatus extends StatelessWidget {
  const ClipEventStatus({
    Key? key,
    required this.eventStatus,
  }) : super(key: key);

  final EventStatus eventStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          eventStatus.iconData,
          size: 16,
          color: eventStatus.color,
        ),
        const SizedBox(width: 10),
        Text(
          eventStatus.label,
          style: AppTextStyles.verySmallDarkSemiBold,
        ),
      ],
    );
  }
}
