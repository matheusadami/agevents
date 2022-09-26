import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/date.helper.dart';

abstract class MyEventsEvent {}

class SearchMyEventsEvent extends MyEventsEvent {
  String paramName;
  String paramFinalDate;
  String paramInitialDate;
  EventType? paramEventType;
  EventPriority? paramEventPriority;

  SearchMyEventsEvent({
    this.paramName = '',
    this.paramFinalDate = '',
    this.paramInitialDate = '',
    this.paramEventType,
    this.paramEventPriority,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': paramName,
      'finalDate': paramFinalDate.isNotEmpty
          ? DateHelper.convertDateFromBRToUS(paramFinalDate)
          : '',
      'initialDate': paramInitialDate.isNotEmpty
          ? DateHelper.convertDateFromBRToUS(paramInitialDate)
          : '',
      'category': paramEventType?.index,
      'priority': paramEventPriority?.index,
    };
  }
}
