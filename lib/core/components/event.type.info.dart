import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class EventTypeInfo extends StatelessWidget {
  const EventTypeInfo({
    Key? key,
    required this.eventModel,
    this.isShowFavorite = false,
  }) : super(key: key);

  final bool isShowFavorite;
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipEventType(eventType: eventModel.eventType!),
        Row(
          children: [
            Icon(
              eventModel.eventStatus!.iconData,
              size: 16,
              color: eventModel.eventStatus!.color,
            ),
            const SizedBox(width: 10),
            Text(
              eventModel.eventStatus!.label,
              style: AppTextStyles.verySmallDarkSemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
