abstract class EventSheetState {}

class InitialStateEventSheetState extends EventSheetState {}

class LoadingEventSheetState extends EventSheetState {}

class ExceptionEventSheetState extends EventSheetState {
  final String message;

  ExceptionEventSheetState(this.message);
}
