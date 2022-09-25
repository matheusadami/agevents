import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:flutter/cupertino.dart';

abstract class EventSheetEvent {}

class ChangeStatusEventSheetEvent extends EventSheetEvent {
  final EventModel eventModel;
  final EventStatus eventStatus;

  ChangeStatusEventSheetEvent({
    required this.eventModel,
    required this.eventStatus,
  });
}

class RemoveEventSheetEvent extends EventSheetEvent {
  final EventModel eventModel;

  RemoveEventSheetEvent({required this.eventModel});
}

class AlterEventSheetEvent extends EventSheetEvent {
  final BuildContext context;

  AlterEventSheetEvent({required this.context});
}
