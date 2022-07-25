import 'package:agevents/core/components/event.list.item.dart';
import 'package:flutter/material.dart';

class EventListView extends StatelessWidget {
  final bool isShowFavorite;
  const EventListView({
    Key? key,
    this.isShowFavorite = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, i) => const Divider()),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) => EventListItem(
        isShowFavorite: isShowFavorite,
      ),
    );
  }
}
