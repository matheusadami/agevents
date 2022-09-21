import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';

abstract class MyEventsEvent {
  const MyEventsEvent();
}

class SearchMyEventsEvent extends MyEventsEvent {
  String name;
  String finalDate;
  String initialDate;
  EventType? eventType;
  EventPriority? eventPriority;

  SearchMyEventsEvent({
    this.name = '',
    this.finalDate = '',
    this.initialDate = '',
    this.eventType,
    this.eventPriority,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'finalDate': finalDate,
      'initialDate': initialDate,
      'eventType': eventType,
      'eventPriority': eventPriority,
    };
  }
}
