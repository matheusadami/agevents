import 'package:agevents/app/blocs/board/board.event.dart';
import 'package:agevents/app/blocs/board/board.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/models/graphic.model.dart';
import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/helpers/event.helper.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  late final AuthUserProvider authUserProvider;
  late final IEventsRepository eventsRepository;

  BoardBloc() : super(InitialStateBoardState()) {
    authUserProvider = NavigationService.context!.read<AuthUserProvider>();
    eventsRepository = NavigationService.context!.read<IEventsRepository>();
    on<LoadBoardEvent>(load);
  }

  void load(LoadBoardEvent event, Emitter emit) async {
    try {
      emit(LoadingBoardState());

      // Only for showing the loading animation...
      await Future.delayed(const Duration(seconds: 1));

      final GraphicModel graphicModel = GraphicModel(graphicSectionModels: []);

      final Map<String, dynamic> variables = {
        'userId': authUserProvider.currentUser.id,
      };
      final data = await eventsRepository.searchEventsFromUser(variables);
      final events = data.map((e) => EventModel.fromMap(e)).toList();

      final personalEvents = EventHelper.getEventsByType(
        events,
        EventType.personalEvent.value,
      );
      graphicModel.pushSection(
        eventType: EventType.personalEvent,
        qtdeEvents: events.length,
        qtdePercentageEvents: personalEvents.length,
      );

      final studyType = EventHelper.getEventsByType(
        events,
        EventType.studyEvent.value,
      );
      graphicModel.pushSection(
        eventType: EventType.studyEvent,
        qtdeEvents: events.length,
        qtdePercentageEvents: studyType.length,
      );

      final workType = EventHelper.getEventsByType(
        events,
        EventType.workEvent.value,
      );
      graphicModel.pushSection(
        eventType: EventType.workEvent,
        qtdeEvents: events.length,
        qtdePercentageEvents: workType.length,
      );

      final doingEvents = EventHelper.getEventsByStatus(
        events,
        EventStatus.doing.value,
      );
      final pendingEvents = EventHelper.getEventsByStatus(
        events,
        EventStatus.pending.value,
      );
      final completedEvents = EventHelper.getEventsByStatus(
        events,
        EventStatus.completed.value,
      );

      final loadedBoardEvent = LoadedBoardState(
        qtdeEvents: events.length,
        graphicModel: graphicModel,
        qtdeDoingEvents: doingEvents.length,
        qtdePendingEvents: pendingEvents.length,
        qtdeCompletedEvents: completedEvents.length,
      );

      emit(loadedBoardEvent);
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(ExceptionBoardState(e.message));
    }
  }
}
