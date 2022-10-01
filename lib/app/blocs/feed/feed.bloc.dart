import 'package:agevents/app/blocs/feed/feed.event.dart';
import 'package:agevents/app/blocs/feed/feed.state.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(InitialStateFeedState()) {
    on<LoadEventsTodayFeedEvent>(loadEventsTodayFromUser);
  }

  void loadEventsTodayFromUser(
    LoadEventsTodayFeedEvent event,
    Emitter emit,
  ) async {
    try {
      emit(LoadingFeedState());

      // Loading the today's events

      emit(LoadedFeedState(events: []));
    } catch (e) {
      AlertsHelper.showWarnSnackBar('Não foi possível carregar os eventos');
    }
  }
}
