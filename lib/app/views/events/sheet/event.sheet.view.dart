import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/core/components/clip.event.priority.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventSheetView extends StatelessWidget {
  const EventSheetView({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
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
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              child: Text(
                eventModel.name,
                style: AppTextStyles.mediumDarkSemiBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipEventDate(eventModel: eventModel),
                  ClipEventStatus(eventModel: eventModel),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                eventModel.description,
                style: AppTextStyles.verySmallDarkSemiBold,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CommonButtonWidget(
                icon: const Icon(
                  FontAwesomeIcons.pen,
                  size: 24,
                  color: AppColors.white,
                ),
                label: 'Alterar',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CommonButtonWidget(
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 24,
                  color: AppColors.white,
                ),
                label: 'Remover',
                onTap: () {},
                backgroundColor: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipEventStatus extends StatelessWidget {
  const ClipEventStatus({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class ClipEventDate extends StatelessWidget {
  const ClipEventDate({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            FontAwesomeIcons.solidCalendarCheck,
            size: 16,
            color: AppColors.darkGray,
          ),
        ),
        Text(
          eventModel.date,
          style: AppTextStyles.verySmallDarGraykSemiBold,
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray,
      width: 2,
      height: 24,
    );
  }
}
