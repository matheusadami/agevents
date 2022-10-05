import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/date.helper.dart';

abstract class EventEvent {}

class LoadEventUpdateEventEvent extends EventEvent {
  final String eventId;

  LoadEventUpdateEventEvent(this.eventId);
}

class SubmitFormCreateEventEvent extends EventEvent {
  final String id;
  final String name;
  final String date;
  final String description;
  final EventType eventType;
  final EventPriority eventPriority;

  SubmitFormCreateEventEvent({
    this.id = '',
    required this.name,
    required this.date,
    required this.description,
    required this.eventType,
    required this.eventPriority,
  });

  Map<String, dynamic> toMap({required String userId}) {
    return {
      'userId': userId,
      'title': name,
      'date': DateHelper.convertDateFromBRToUS(date),
      'description': description,
      'status': EventStatus.pending.value,
      'category': eventType.value,
      'priority': eventPriority.value,
    };
  }
}

class SubmitFormUpdateEventEvent extends EventEvent {
  final String id;
  final String name;
  final String date;
  final String description;
  final EventType eventType;
  final EventPriority eventPriority;

  SubmitFormUpdateEventEvent({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    required this.eventType,
    required this.eventPriority,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventId': id,
      'title': name,
      'date': DateHelper.convertDateFromBRToUS(date),
      'description': description,
      'category': eventType.value,
      'priority': eventPriority.value,
    };
  }
}
