import 'package:agevents/app/blocs/events/create/event.event.dart';
import 'package:agevents/app/blocs/events/create/event.state.dart';
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
    on<SubmitFormEventEvent>(submitForm);
  }

  void submitForm(SubmitFormEventEvent event, Emitter emit) async {
    try {
      emit(LoadingEventState());

      final variables = event.toMap();
      variables['userId'] = authUserProvider.currentUser.id;

      await eventsRepository.create(variables);

      AlertsHelper.showSuccessSnackBar('Evento cadastrado com sucesso');
      emit(SuccessCreatedEventState());
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormEventState());
    }
  }
}
