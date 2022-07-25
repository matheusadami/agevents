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
        /*
        const Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 16,
          ),
          child: Icon(
            FontAwesomeIcons.userGroup,
            size: 16,
            color: AppColors.gray,
          ),
        ),
        */
        Container(
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            child: Center(
              child: Text(
                'Alta',
                style: AppTextStyles.verySmallWhiteSemiBold,
              ),
            ),
          ),
        ),
        /*
        Text(
          '7 pessoas',
          style: AppTextStyles.verySmallGraySemiBold,
        ),
        */
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
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.hammer,
                    size: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Trabalho',
                    style: AppTextStyles.verySmallTertiarySemiBold,
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isShowFavorite,
          child: const FavoriteIconButton(),
        ),
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
