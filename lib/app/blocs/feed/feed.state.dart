import 'package:agevents/app/models/event.model.dart';

abstract class FeedState {}

class InitialStateFeedState extends FeedState {}

class LoadingFeedState extends FeedState {}

class LoadedFeedState extends FeedState {
  List<EventModel> events;

  LoadedFeedState({required this.events});
}

class ExceptionFeedState extends FeedState {
  final String message;

  ExceptionFeedState(this.message);
}
