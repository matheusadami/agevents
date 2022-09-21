abstract class MyEventsState {}

class InitialStateMyEventsState extends MyEventsState {}

class LoadingMyEventsState extends MyEventsState {}

class LoadedMyEventsState extends MyEventsState {}

class ExceptionMyEventsState extends MyEventsState {
  final String message;

  ExceptionMyEventsState(this.message);
}
