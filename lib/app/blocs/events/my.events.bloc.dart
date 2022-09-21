import 'package:agevents/app/blocs/events/my.events.event.dart';
import 'package:agevents/app/blocs/events/my.events.state.dart';
import 'package:agevents/app/repositories/events/events.repository.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEventsBloc extends Bloc<MyEventsEvent, MyEventsState> {
  late AuthUserProvider authUserProvider;
  late EventsRepository eventsRepository;

  MyEventsBloc() : super(InitialStateMyEventsState()) {
    authUserProvider = NavigationService.context!.read<AuthUserProvider>();
    eventsRepository = NavigationService.context!.read<EventsRepository>();

    on<SearchMyEventsEvent>(searchMyEvents);
  }

  void searchMyEvents(SearchMyEventsEvent event, Emitter emit) async {
    try {
      emit(LoadingMyEventsState());

      final events = await eventsRepository.searchEventsFromUser({
        'userId': authUserProvider.currentUser.id,
      });

      print(events);

      emit(LoadedMyEventsState());
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(ExceptionMyEventsState(e.message));
    }
  }
}
