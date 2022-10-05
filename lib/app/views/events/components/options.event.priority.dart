import 'package:agevents/core/components/clip.event.priority.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:flutter/material.dart';

class OptionsEventPriorityWidget extends StatelessWidget {
  const OptionsEventPriorityWidget({
    Key? key,
    required this.onChange,
    this.selectedType,
  }) : super(key: key);

  final int? selectedType;
  final void Function(EventPriority eventPriority) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipEventPriority(
            onTap: (eventPriority, context) => onChange(eventPriority),
            isSelected: selectedType == EventPriority.low.value,
            eventPriority: EventPriority.low,
          ),
          const SizedBox(width: 8),
          ClipEventPriority(
            onTap: (eventPriority, context) => onChange(eventPriority),
            isSelected: selectedType == EventPriority.high.value,
            eventPriority: EventPriority.high,
          ),
        ],
      ),
    );
  }
}
