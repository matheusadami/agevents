import 'package:agevents/app/models/event.model.dart';

abstract class EventSheetState {}

class FormEventSheetState extends EventSheetState {
  final EventModel eventModel;
  FormEventSheetState({required this.eventModel});
}

class LoadingEventSheetState extends EventSheetState {}

class DismissBottomSheetEventSheetState extends EventSheetState {}

class ExceptionEventSheetState extends EventSheetState {
  final String message;

  ExceptionEventSheetState(this.message);
}
