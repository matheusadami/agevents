import 'package:agevents/app/blocs/events/create/event.bloc.dart';
import 'package:agevents/app/blocs/events/create/event.event.dart';
import 'package:agevents/app/blocs/events/create/event.state.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsEventTypeWidget extends StatelessWidget {
  const OptionsEventTypeWidget({Key? key}) : super(key: key);

  void onTapChangeEventType(EventType eventType, BuildContext context) {
    context.read<EventBloc>().add(ChangeTypeEventEvent(eventType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      buildWhen: (previous, current) {
        final int? pType = previous.eventModel.eventType?.index;
        final int? cType = current.eventModel.eventType?.index;
        return pType != cType;
      },
      builder: (context, state) {
        final int? type = state.eventModel.eventType?.index;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              ClipEventType(
                onTap: onTapChangeEventType,
                eventType: EventType.personalEvent,
                isSelected: type == EventType.personalEvent.index,
              ),
              const SizedBox(width: 8),
              ClipEventType(
                onTap: onTapChangeEventType,
                eventType: EventType.workEvent,
                isSelected: type == EventType.workEvent.index,
              ),
              const SizedBox(width: 8),
              ClipEventType(
                onTap: onTapChangeEventType,
                eventType: EventType.studyEvent,
                isSelected: type == EventType.studyEvent.index,
              ),
              const SizedBox(width: 8),
            ],
          ),
        );
      },
    );
  }
}
