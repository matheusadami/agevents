import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/components/clip.event.date.dart';
import 'package:agevents/core/components/clip.event.priority.dart';
import 'package:agevents/core/components/clip.event.status.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({
    Key? key,
    this.isShowFavorite = true,
    required this.eventModel,
    required this.onTap,
  }) : super(key: key);

  final bool isShowFavorite;
  final EventModel eventModel;
  final void Function(EventModel eventModel) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => onTap(eventModel),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipEventPriority(eventPriority: eventModel.eventPriority!),
                    ClipEventType(eventType: eventModel.eventType!),
                  ],
                ),
              ),
              const Divider(color: AppColors.gray, thickness: 1, height: 5),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: Text(
                  eventModel.name,
                  style: AppTextStyles.smallDarkSemiBold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipEventDate(eventModel: eventModel),
                    ClipEventStatus(eventStatus: eventModel.eventStatus!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
