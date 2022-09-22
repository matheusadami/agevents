import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/components/event.priority.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({
    Key? key,
    this.isShowFavorite = true,
    required this.eventModel,
  }) : super(key: key);

  final bool isShowFavorite;
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: isShowFavorite ? 0 : 11.5,
              top: isShowFavorite ? 0 : 11.5,
            ),
            child: EventTypeInfo(
              eventModel: eventModel,
              isShowFavorite: isShowFavorite,
            ),
          ),
          Text(
            eventModel.name,
            style: AppTextStyles.smallDarkSemiBold,
          ),
          const SizedBox(height: 8),
          EventSubtitleInfo(eventModel: eventModel),
        ],
      ),
    );
  }
}

class EventSubtitleInfo extends StatelessWidget {
  const EventSubtitleInfo({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                FontAwesomeIcons.solidCalendarCheck,
                size: 16,
                color: AppColors.gray,
              ),
            ),
            Text(
              eventModel.date,
              style: AppTextStyles.verySmallGraySemiBold,
            ),
          ],
        ),
        const SizedBox(width: 25),
        ClipEventPriority(eventPriority: eventModel.eventPriority!),
      ],
    );
  }
}

class EventTypeInfo extends StatelessWidget {
  const EventTypeInfo({
    Key? key,
    required this.eventModel,
    required this.isShowFavorite,
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
        /*
        Visibility(
          visible: isShowFavorite,
          child: const FavoriteIconButton(),
        ),
        */
      ],
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      padding: const EdgeInsets.all(0.0),
      onPressed: () {},
      icon: const Icon(
        FontAwesomeIcons.heart,
        color: AppColors.gray,
      ),
    );
  }
}
