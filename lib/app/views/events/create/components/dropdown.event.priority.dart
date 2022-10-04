import 'package:agevents/core/components/clip.event.priority.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownEventPriority extends StatelessWidget {
  DropdownEventPriority({super.key, this.eventType, required this.onChange});

  final EventPriority? eventType;
  final void Function(EventPriority? eventType) onChange;

  final List<EventPriority> optionsEventPriority = [
    EventPriority.low,
    EventPriority.high,
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<EventPriority?>(
      isExpanded: true,
      value: eventType,
      icon: const Icon(
        FontAwesomeIcons.caretDown,
        size: 16,
      ),
      items: optionsEventPriority.map<DropdownMenuItem<EventPriority>>(
        (e) {
          return DropdownMenuItem<EventPriority>(
            value: e,
            child: ClipEventPriority(
              eventPriority: e,
            ),
          );
        },
      ).toList(),
      onChanged: onChange,
    );
  }
}
