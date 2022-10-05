import 'package:agevents/app/blocs/events/form/event.event.dart';
import 'package:agevents/app/blocs/events/form/event.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  late final IEventsRepository eventsRepository;
  late final AuthUserProvider authUserProvider;

  EventBloc() : super(FormEventState()) {
    eventsRepository = NavigationService.context!.read<IEventsRepository>();
    authUserProvider = NavigationService.context!.read<AuthUserProvider>();

    on<LoadEventUpdateEventEvent>(loadEventUpdate);
    on<SubmitFormCreateEventEvent>(create);
    on<SubmitFormUpdateEventEvent>(update);
  }

  void create(SubmitFormCreateEventEvent event, Emitter emit) async {
    try {
      emit(LoadingEventState());

      final variables = event.toMap(
        userId: authUserProvider.currentUser.id!,
      );

      await eventsRepository.create(variables);

      AlertsHelper.showSuccessSnackBar('Evento cadastrado com sucesso');
      emit(SuccessCreatedEventState());
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormEventState());
    }
  }

  void update(SubmitFormUpdateEventEvent event, Emitter emit) async {
    try {
      emit(LoadingEventState());

      final variables = event.toMap();
      await eventsRepository.update(variables);

      AlertsHelper.showSuccessSnackBar('Evento alterado com sucesso');
      emit(SuccessUpdatedEventState());
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormEventState());
    }
  }

  void loadEventUpdate(LoadEventUpdateEventEvent event, Emitter emit) async {
    try {
      emit(LoadingEventState());

      // Only for showing the animation loading...
      await Future.delayed(const Duration(seconds: 1));

      final variables = {'eventId': event.eventId};

      final data = await eventsRepository.getEventById(variables);
      final eventModel = EventModel.fromMap(data);

      emit(FormEventState.fromUpdate(eventModel: eventModel));
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(ExceptionEventState(e.message));
    }
  }
}
