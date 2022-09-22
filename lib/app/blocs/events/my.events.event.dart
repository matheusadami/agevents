import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/date.helper.dart';

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
      'title': name,
      'finalDate': finalDate.isNotEmpty
          ? DateHelper.convertDateFromBRToUS(finalDate)
          : '',
      'initialDate': initialDate.isNotEmpty
          ? DateHelper.convertDateFromBRToUS(initialDate)
          : '',
      'category': eventType?.index,
      'priority': eventPriority?.index,
    };
  }
}
