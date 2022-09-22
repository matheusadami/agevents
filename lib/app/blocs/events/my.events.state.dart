import 'package:agevents/app/models/event.model.dart';

abstract class MyEventsState {}

class InitialStateMyEventsState extends MyEventsState {}

class LoadingMyEventsState extends MyEventsState {}

class LoadedMyEventsState extends MyEventsState {
  final List<EventModel> events;

  LoadedMyEventsState({required this.events});
}

class ExceptionMyEventsState extends MyEventsState {
  final String message;

  ExceptionMyEventsState(this.message);
}
