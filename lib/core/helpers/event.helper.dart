import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/enums/event.type.dart';

class EventHelper {
  static List<EventModel> getEventsByStatus(
    List<EventModel> events,
    int value,
  ) {
    return events.where((e) => e.eventStatus?.value == value).toList();
  }

  static List<EventModel> getEventsByType(
    List<EventModel> events,
    int value,
  ) {
    return events.where((e) => e.eventType?.value == value).toList();
  }

  static EventPriority getEventPriorityByValue([int value = 1]) {
    return EventPriority.values.firstWhere((e) => e.value == value);
  }

  static EventStatus getEventStatusByValue([int value = 1]) {
    return EventStatus.values.firstWhere((e) => e.value == value);
  }

  static EventType getEventTypeByValue([int value = 1]) {
    return EventType.values.firstWhere((e) => e.value == value);
  }
}
