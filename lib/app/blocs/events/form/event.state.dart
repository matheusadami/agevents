import 'dart:async';

import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class EventState {}

class FormEventState extends EventState {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: '');
  final dateController = TextEditingController(text: '');
  final descriptionController = TextEditingController(text: '');
  final eventTypeController = BehaviorSubject<EventType?>();
  final eventPriorityController = BehaviorSubject<EventPriority?>();

  FormEventState();

  FormEventState.fromUpdate({required EventModel eventModel}) {
    nameController.text = eventModel.name;
    dateController.text = eventModel.date;
    descriptionController.text = eventModel.description;
    eventTypeController.sink.add(eventModel.eventType);
    eventPriorityController.sink.add(eventModel.eventPriority);
  }

  String? validatorName(String value) {
    return value.isEmpty ? 'Por favor informe o nome do evento' : null;
  }

  String? validatorDate(String value) {
    return value.isEmpty ? 'Por favor informe a data do evento' : null;
  }

  String? validatorDescription(String value) {
    return value.isEmpty ? 'Por favor informe a descrição do evento' : null;
  }

  Future<String?> validatorEventType(EventType? eventType) async {
    const message = 'Por favor informe a categoria do evento';
    return eventType == null ? message : null;
  }

  Future<String?> validatorEventPriority(EventPriority? eventPriority) async {
    const message = 'Por favor informe a prioridade do evento';
    return eventPriority == null ? message : null;
  }
}

class LoadingEventState extends EventState {}

class SuccessCreatedEventState extends EventState {}

class SuccessUpdatedEventState extends EventState {}

class ExceptionEventState extends EventState {
  final String message;

  ExceptionEventState(this.message);
}
