import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClipEventType extends StatelessWidget {
  final bool isSelected;
  final EventType eventType;
  final void Function(EventType eventType, BuildContext context)? onTap;

  const ClipEventType({
    Key? key,
    this.onTap,
    required this.eventType,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(eventType, context);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.green.withOpacity(0.2)
                : eventType.color.withOpacity(0.2),
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
                      : eventType.icon,
                  size: 16,
                  color: isSelected ? AppColors.green : eventType.color,
                ),
                const SizedBox(width: 8),
                Text(
                  eventType.label,
                  style: AppTextStyles.makeVerySmallSemiBoldByColor(
                    isSelected ? AppColors.green : eventType.color,
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
