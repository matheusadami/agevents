import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class ClipEventPriority extends StatelessWidget {
  final EventPriority eventPriority;

  const ClipEventPriority({
    Key? key,
    required this.eventPriority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        color: eventPriority.color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 2,
          ),
          child: Center(
            child: Text(
              eventPriority.label,
              style: AppTextStyles.makeVerySmallSemiBoldByColor(
                eventPriority.colorLabel,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
