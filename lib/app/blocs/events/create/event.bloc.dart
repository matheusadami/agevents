import 'package:agevents/app/blocs/events/create/event.event.dart';
import 'package:agevents/app/blocs/events/create/event.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(FormEventState(EventModel.empty())) {
    on<ChangeNameEventEvent>(changeName);
    on<ChangeDateEventEvent>(changeDate);
    on<ChangeDescriptionEventEvent>(changeDescription);
    on<ChangeTypeEventEvent>(changeType);
    on<ChangePriorityEventEvent>(changePriority);
  }

  void changeName(ChangeNameEventEvent event, Emitter<EventState> emit) {
    emit(FormEventState(state.eventModel.copyWith(name: event.name)));
  }

  void changeDate(ChangeDateEventEvent event, Emitter<EventState> emit) {
    emit(FormEventState(state.eventModel.copyWith(date: event.date)));
  }

  void changeDescription(
    ChangeDescriptionEventEvent event,
    Emitter<EventState> emit,
  ) {
    emit(FormEventState(
      state.eventModel.copyWith(description: event.description),
    ));
  }

  void changeType(ChangeTypeEventEvent event, Emitter emit) {
    emit(FormEventState(state.eventModel.copyWith(eventType: event.eventType)));
  }

  void changePriority(
    ChangePriorityEventEvent event,
    Emitter<EventState> emit,
  ) {
    emit(FormEventState(
      state.eventModel.copyWith(eventPriority: event.eventPriority),
    ));
  }
}
