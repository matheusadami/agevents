import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClipEventPriority extends StatelessWidget {
  final bool isSelected;
  final EventPriority eventPriority;
  final void Function(EventPriority eventPriority, BuildContext context)? onTap;

  const ClipEventPriority({
    Key? key,
    this.onTap,
    this.isSelected = false,
    required this.eventPriority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(eventPriority, context);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.green.withOpacity(0.2)
                : eventPriority.color.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected
                      ? FontAwesomeIcons.solidCircleCheck
                      : eventPriority.icon,
                  size: 16,
                  color: isSelected ? AppColors.green : eventPriority.color,
                ),
                const SizedBox(width: 4),
                Text(
                  eventPriority.label,
                  style: AppTextStyles.makeVerySmallSemiBoldByColor(
                    isSelected ? AppColors.green : eventPriority.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
