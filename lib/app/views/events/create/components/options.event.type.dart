import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:flutter/material.dart';

class OptionsEventTypeWidget extends StatelessWidget {
  const OptionsEventTypeWidget({
    Key? key,
    required this.onChange,
    this.selectedType,
  }) : super(key: key);

  final int? selectedType;
  final void Function(EventType eventType) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipEventType(
            onTap: (eventType, context) => onChange(eventType),
            eventType: EventType.personalEvent,
            isSelected: selectedType == EventType.personalEvent.index,
          ),
          const SizedBox(width: 8),
          ClipEventType(
            onTap: (eventType, context) => onChange(eventType),
            eventType: EventType.workEvent,
            isSelected: selectedType == EventType.workEvent.index,
          ),
          const SizedBox(width: 8),
          ClipEventType(
            onTap: (eventType, context) => onChange(eventType),
            eventType: EventType.studyEvent,
            isSelected: selectedType == EventType.studyEvent.index,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
