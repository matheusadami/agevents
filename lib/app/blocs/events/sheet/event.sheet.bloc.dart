import 'package:agevents/app/blocs/events/sheet/event.sheet.event.dart';
import 'package:agevents/app/blocs/events/sheet/event.sheet.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSheetBloc extends Bloc<EventSheetEvent, EventSheetState> {
  late final IEventsRepository eventsRepository;

  EventSheetBloc() : super(InitialStateEventSheetState()) {
    eventsRepository = NavigationService.context!.read<IEventsRepository>();

    on<LoadUpdatedEventSheetEvent>(loadUpdatedEvent);
    on<ChangeStatusEventSheetEvent>(changeStatus);
    on<RemoveEventSheetEvent>(removeEvent);
    on<AlterEventSheetEvent>(alterEvent);
  }

  void loadUpdatedEvent(LoadUpdatedEventSheetEvent event, Emitter emit) async {
    try {
      emit(LoadingEventSheetState());

      await Future.delayed(const Duration(seconds: 1));

      final Map<String, dynamic> variables = {'eventId': event.eventId};

      final data = await eventsRepository.getEventById(variables);
      final eventModel = EventModel.fromMap(data);

      emit(FormEventSheetState(eventModel: eventModel));
    } catch (e) {
      AlertsHelper.showWarnSnackBar('Não foi possível carregar o evento');
      emit(DismissBottomSheetEventSheetState());
    }
  }

  void changeStatus(ChangeStatusEventSheetEvent event, Emitter emit) async {
    try {
      emit(LoadingEventSheetState());

      await Future.delayed(const Duration(seconds: 1));

      final Map<String, dynamic> variables = {
        'eventId': event.eventModel.id,
        'status': event.eventStatus.value,
      };

      await eventsRepository.changeStatus(variables);

      AlertsHelper.showSuccessSnackBar('Situação do evento alterada');
      emit(DismissBottomSheetEventSheetState());
    } catch (e) {
      AlertsHelper.showWarnSnackBar(
        'Não foi possível alterar a situação do evento',
        isRemoveHorizontalMargin: true,
      );
      emit(FormEventSheetState(
        eventModel: event.eventModel.copyWith(
          eventStatus: event.eventStatus,
        ),
      ));
    }
  }

  void removeEvent(RemoveEventSheetEvent event, Emitter emit) async {
    try {
      emit(LoadingEventSheetState());

      await Future.delayed(const Duration(seconds: 1));

      final Map<String, dynamic> variables = {'eventId': event.eventModel.id};

      await eventsRepository.removeEvent(variables);

      AlertsHelper.showSuccessSnackBar('Evento removido com sucesso');
      emit(DismissBottomSheetEventSheetState());
    } catch (e) {
      AlertsHelper.showWarnSnackBar(
        'Não foi possível remover o evento',
        isRemoveHorizontalMargin: true,
      );
      emit(FormEventSheetState(eventModel: event.eventModel));
    }
  }

  void alterEvent(AlterEventSheetEvent event, Emitter emit) {
    Navigator.pushReplacementNamed(event.context, '/create-event');
  }
}
