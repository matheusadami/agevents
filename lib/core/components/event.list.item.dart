import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/components/event.priority.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventListItem extends StatelessWidget {
  final bool isShowFavorite;
  const EventListItem({
    Key? key,
    this.isShowFavorite = true,
  }) : super(key: key);

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
            child: EventTypeInfo(isShowFavorite: isShowFavorite),
          ),
          Text(
            'Reunião de Negócios',
            style: AppTextStyles.smallDarkSemiBold,
          ),
          const SizedBox(height: 8),
          const EventSubtitleInfo(),
        ],
      ),
    );
  }
}

class EventSubtitleInfo extends StatelessWidget {
  const EventSubtitleInfo({Key? key}) : super(key: key);

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
              '10/10/2022',
              style: AppTextStyles.verySmallGraySemiBold,
            ),
          ],
        ),
        const SizedBox(width: 25),
        const ClipEventPriority(eventPriority: EventPriority.high),
      ],
    );
  }
}

class EventTypeInfo extends StatelessWidget {
  final bool isShowFavorite;

  const EventTypeInfo({
    Key? key,
    required this.isShowFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClipEventType(
          eventType: EventType.workEvent,
        ),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.spinner,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Text(
              'Em andamento',
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
