import 'package:agevents/app/blocs/feed/feed.event.dart';
import 'package:agevents/app/blocs/feed/feed.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/app/repositories/feed/interface.feed.repository.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/date.helper.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  late final IFeedRepository feedRepository;
  late final IEventsRepository eventsRepository;
  late final AuthUserProvider authUserProvider;

  FeedBloc() : super(InitialStateFeedState()) {
    feedRepository = NavigationService.context!.read<IFeedRepository>();
    eventsRepository = NavigationService.context!.read<IEventsRepository>();
    authUserProvider = NavigationService.context!.read<AuthUserProvider>();

    on<MarkEventAsCompletedFeedEvent>(markEventAsCompleted);
    on<LoadEventsTodayFeedEvent>(loadEventsToday);
    on<LogoutFeedEvent>(logout);
  }

  void markEventAsCompleted(
    MarkEventAsCompletedFeedEvent event,
    Emitter emit,
  ) async {
    try {
      emit(LoadingFeedState());

      // Only for showing the loading animation...
      await Future.delayed(const Duration(seconds: 1));

      final Map<String, dynamic> variables = {
        'eventId': event.eventModel.id,
        'status': EventStatus.completed.value,
      };

      await eventsRepository.changeStatus(variables);

      AlertsHelper.showSuccessSnackBar('Evento finalizado com sucesso');
      add(LoadEventsTodayFeedEvent());
    } catch (e) {
      AlertsHelper.showWarnSnackBar('Não foi possível finalizado o evento');
      emit(LoadedFeedState(events: List.from(event.events)));
    }
  }

  void loadEventsToday(LoadEventsTodayFeedEvent event, Emitter emit) async {
    try {
      emit(LoadingFeedState());

      // Only for showing the loading animation...
      await Future.delayed(const Duration(seconds: 1));

      final Map<String, dynamic> variables = {
        'userId': authUserProvider.currentUser.id,
        'finalDate': DateHelper.getCurrentDateUSFormat(const Duration(days: 1)),
        'initialDate': DateHelper.getCurrentDateUSFormat(),
      };

      final events = await feedRepository.getEventsTodayFromUser(variables);
      final convertEvents = events.map((e) => EventModel.fromMap(e)).toList();

      emit(LoadedFeedState(events: List.from(convertEvents.reversed.toList())));
    } catch (e) {
      AlertsHelper.showWarnSnackBar('Não foi possível carregar os eventos');
    }
  }

  void logout(LogoutFeedEvent event, Emitter emit) {
    authUserProvider.removeAuthUser();
    Navigator.pushReplacementNamed(event.context, '/signin');
  }
}
