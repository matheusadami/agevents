import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/date.helper.dart';

abstract class EventEvent {}

class SubmitFormEventEvent extends EventEvent {
  final String name;
  final String date;
  final String description;
  final EventType eventType;
  final EventPriority eventPriority;

  SubmitFormEventEvent({
    required this.name,
    required this.date,
    required this.description,
    required this.eventType,
    required this.eventPriority,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': name,
      'date': DateHelper.convertDateFromBRToUS(date),
      'description': description,
      'status': EventStatus.pending.index,
      'category': eventType.index,
      'priority': eventPriority.index,
    };
  }
}
