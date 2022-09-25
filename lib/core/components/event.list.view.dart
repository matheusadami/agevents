import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/components/event.list.item.dart';
import 'package:flutter/material.dart';

class EventListView extends StatelessWidget {
  const EventListView({
    Key? key,
    this.isShowFavorite = true,
    required this.events,
    required this.onTap,
  }) : super(key: key);

  final bool isShowFavorite;
  final List<EventModel> events;
  final void Function(EventModel eventModel) onTap;

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
        onTap: onTap,
        eventModel: events[i],
        isShowFavorite: isShowFavorite,
      ),
    );
  }
}
