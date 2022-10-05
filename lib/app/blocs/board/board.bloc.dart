import 'package:agevents/app/blocs/board/board.event.dart';
import 'package:agevents/app/blocs/board/board.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/models/graphic.model.dart';
import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/core/enums/event.status.dart';
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
    emit(LoadingBoardState());

    final Map<String, dynamic> variables = {
      'userId': authUserProvider.currentUser.id,
    };
    final data = await eventsRepository.searchEventsFromUser(variables);
    final events = data.map((e) => EventModel.fromMap(e)).toList();

    final qtdeDoingEvents = EventHelper.getEventsByEventStatus(
      events,
      EventStatus.doing.value,
    );
    final qtdePendingEvents = EventHelper.getEventsByEventStatus(
      events,
      EventStatus.pending.value,
    );
    final qtdeCompletedEvents = EventHelper.getEventsByEventStatus(
      events,
      EventStatus.completed.value,
    );

    final graphicModel = GraphicModel(
      percentagePersonalEvents: 30,
      percentageStudyEvents: 40,
      percentageWorkEvents: 40,
    );

    emit(LoadedBoardState(
      qtdeEvents: events.length,
      qtdeDoingEvents: qtdeDoingEvents.length,
      qtdePendingEvents: qtdePendingEvents.length,
      qtdeCompletedEvents: qtdeCompletedEvents.length,
      graphicModel: graphicModel,
    ));
  }
}
