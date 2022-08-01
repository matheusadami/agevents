import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';

abstract class EventEvent {}

class ChangeNameEventEvent extends EventEvent {
  final String name;

  ChangeNameEventEvent(this.name);
}

class ChangeDateEventEvent extends EventEvent {
  final String date;

  ChangeDateEventEvent(this.date);
}

class ChangeDescriptionEventEvent extends EventEvent {
  final String description;

  ChangeDescriptionEventEvent(this.description);
}

class ChangeTypeEventEvent extends EventEvent {
  final EventType eventType;

  ChangeTypeEventEvent(this.eventType);
}

class ChangePriorityEventEvent extends EventEvent {
  final EventPriority eventPriority;

  ChangePriorityEventEvent(this.eventPriority);
}

class SubmitFormEventEvent extends EventEvent {
  final EventModel eventModel;

  SubmitFormEventEvent(this.eventModel);
}
