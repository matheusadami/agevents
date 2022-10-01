import 'package:agevents/app/blocs/events/my.events.event.dart';
import 'package:agevents/app/blocs/events/my.events.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEventsBloc extends Bloc<MyEventsEvent, MyEventsState> {
  late AuthUserProvider authUserProvider;
  late IEventsRepository eventsRepository;

  MyEventsBloc() : super(InitialStateMyEventsState()) {
    authUserProvider = NavigationService.context!.read<AuthUserProvider>();
    eventsRepository = NavigationService.context!.read<IEventsRepository>();

    on<SearchMyEventsEvent>(searchMyEvents);
  }

  void searchMyEvents(SearchMyEventsEvent event, Emitter emit) async {
    try {
      emit(LoadingMyEventsState());

      final Map<String, dynamic> variables = {
        'userId': authUserProvider.currentUser.id
      }..addAll(event.toMap());

      final events = await eventsRepository.searchEventsFromUser(variables);
      final convertEvents = events.map((e) => EventModel.fromMap(e)).toList();

      emit(
        LoadedMyEventsState(
          events: List.from(convertEvents),
          paramName: event.paramName,
          paramFinalDate: event.paramFinalDate,
          paramInitialDate: event.paramInitialDate,
        ),
      );
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(ExceptionMyEventsState(e.message));
    }
  }
}
