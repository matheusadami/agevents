import 'package:agevents/app/blocs/events/sheet/event.sheet.event.dart';
import 'package:agevents/app/blocs/events/sheet/event.sheet.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSheetBloc extends Bloc<EventSheetEvent, EventSheetState> {
  EventSheetBloc() : super(InitialStateEventSheetState()) {
    on<ChangeStatusEventSheetEvent>(changeStatus);
    on<RemoveEventSheetEvent>(removeEvent);
    on<AlterEventSheetEvent>(alterEvent);
  }

  void changeStatus(ChangeStatusEventSheetEvent event, Emitter emit) async {}

  void removeEvent(RemoveEventSheetEvent event, Emitter emit) async {}

  void alterEvent(AlterEventSheetEvent event, Emitter emit) {
    Navigator.pushReplacementNamed(event.context, '/create-event');
  }
}
