import 'package:agevents/app/blocs/events/create/event.bloc.dart';
import 'package:agevents/app/blocs/events/create/event.event.dart';
import 'package:agevents/app/blocs/events/create/event.state.dart';
import 'package:agevents/core/components/event.priority.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsEventPriorityWidget extends StatelessWidget {
  const OptionsEventPriorityWidget({Key? key}) : super(key: key);

  void onTapChangeEventPriority(
    EventPriority eventPriority,
    BuildContext context,
  ) {
    context.read<EventBloc>().add(ChangePriorityEventEvent(eventPriority));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      buildWhen: (previous, current) {
        final int? pPriority = previous.eventModel.eventPriority?.index;
        final int? cPriority = current.eventModel.eventPriority?.index;
        return pPriority != cPriority;
      },
      builder: (context, state) {
        final int? priority = state.eventModel.eventPriority?.index;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              ClipEventPriority(
                onTap: onTapChangeEventPriority,
                isLarge: true,
                isSelected: priority == EventPriority.low.index,
                eventPriority: EventPriority.low,
              ),
              const SizedBox(width: 8),
              ClipEventPriority(
                onTap: onTapChangeEventPriority,
                isLarge: true,
                isSelected: priority == EventPriority.medium.index,
                eventPriority: EventPriority.medium,
              ),
              const SizedBox(width: 8),
              ClipEventPriority(
                onTap: onTapChangeEventPriority,
                isLarge: true,
                isSelected: priority == EventPriority.high.index,
                eventPriority: EventPriority.high,
              ),
            ],
          ),
        );
      },
    );
  }
}
