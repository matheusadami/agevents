import 'package:agevents/app/models/event.model.dart';
import 'package:flutter/cupertino.dart';

abstract class FeedEvent {}

class LoadEventsTodayFeedEvent extends FeedEvent {}

class LogoutFeedEvent extends FeedEvent {
  final BuildContext context;

  LogoutFeedEvent(this.context);
}

class MarkEventAsCompletedFeedEvent extends FeedEvent {
  final EventModel eventModel;
  final List<EventModel> events;

  MarkEventAsCompletedFeedEvent({
    required this.eventModel,
    required this.events,
  });
}
