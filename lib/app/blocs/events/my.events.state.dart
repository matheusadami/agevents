import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';

abstract class MyEventsState {}

class InitialStateMyEventsState extends MyEventsState {}

class LoadingMyEventsState extends MyEventsState {}

class LoadedMyEventsState extends MyEventsState {
  final String paramName;
  final String paramFinalDate;
  final String paramInitialDate;
  final EventType? paramEventType;
  final EventPriority? paramEventPriority;
  final List<EventModel> events;

  LoadedMyEventsState({
    this.paramName = '',
    this.paramFinalDate = '',
    this.paramInitialDate = '',
    this.paramEventType,
    this.paramEventPriority,
    required this.events,
  });
}

class ExceptionMyEventsState extends MyEventsState {
  final String message;

  ExceptionMyEventsState(this.message);
}
