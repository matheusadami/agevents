import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/components/event.list.item.dart';
import 'package:flutter/material.dart';

class EventListView extends StatelessWidget {
  final bool isShowFavorite;

  const EventListView({
    Key? key,
    this.isShowFavorite = true,
    required this.events,
  }) : super(key: key);

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, i) => const Divider()),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: events.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) => EventListItem(
        eventModel: events[i],
        isShowFavorite: isShowFavorite,
      ),
    );
  }
}
