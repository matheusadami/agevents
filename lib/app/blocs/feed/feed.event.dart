import 'package:flutter/cupertino.dart';

abstract class FeedEvent {}

class LoadEventsTodayFeedEvent extends FeedEvent {}

class LogoutFeedEvent extends FeedEvent {
  final BuildContext context;

  LogoutFeedEvent(this.context);
}
