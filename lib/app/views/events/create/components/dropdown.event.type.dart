import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownEventType extends StatelessWidget {
  DropdownEventType({super.key, this.eventType, required this.onChange});

  final EventType? eventType;
  final void Function(EventType? eventType) onChange;

  final List<EventType> optionsEventTypes = [
    EventType.personalEvent,
    EventType.studyEvent,
    EventType.workEvent,
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<EventType?>(
      isExpanded: true,
      value: eventType,
      icon: const Icon(
        FontAwesomeIcons.caretDown,
        size: 16,
      ),
      items: optionsEventTypes.map<DropdownMenuItem<EventType>>(
        (e) {
          return DropdownMenuItem<EventType>(
            value: e,
            child: ClipEventType(
              eventType: e,
            ),
          );
        },
      ).toList(),
      onChanged: onChange,
    );
  }
}
