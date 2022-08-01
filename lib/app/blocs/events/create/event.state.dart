import 'package:agevents/app/models/event.model.dart';

abstract class EventState {
  final EventModel eventModel;

  EventState(this.eventModel);
}

class FormEventState extends EventState {
  FormEventState(super.eventModel);
}

class LoadingEventState extends EventState {
  LoadingEventState(super.eventModel);
}

class SuccessEventState extends EventState {
  SuccessEventState(super.eventModel);
}

class ExceptionEventState extends EventState {
  final String message;

  ExceptionEventState(super.eventModel, this.message);
}
