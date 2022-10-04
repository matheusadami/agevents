import 'package:agevents/app/blocs/events/sheet/event.sheet.bloc.dart';
import 'package:agevents/app/blocs/events/sheet/event.sheet.event.dart';
import 'package:agevents/app/blocs/events/sheet/event.sheet.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/views/events/sheet/components/confirm.dialog.remove.event.dart';
import 'package:agevents/core/components/clip.event.date.dart';
import 'package:agevents/core/components/clip.event.priority.dart';
import 'package:agevents/core/components/clip.event.status.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/common.loading.widget.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventSheetView extends StatelessWidget {
  const EventSheetView({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventSheetBloc>(
      create: (context) => EventSheetBloc(eventModel),
      child: BlocConsumer<EventSheetBloc, EventSheetState>(
        listener: (context, state) {
          if (state is DismissBottomSheetEventSheetState) {
            Navigator.pop<bool?>(context, true);
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case FormEventSheetState:
              return EventSheetBodyView(
                eventModel: (state as FormEventSheetState).eventModel,
              );
            case LoadingEventSheetState:
              return const CommonLoadingWidget();
          }

          return Container();
        },
      ),
    );
  }
}

class EventSheetBodyView extends StatelessWidget {
  EventSheetBodyView({super.key, required this.eventModel});

  final EventModel eventModel;

  final List<EventStatus> optionsEventStatus = [
    EventStatus.pending,
    EventStatus.doing,
    EventStatus.completed,
  ];

  void onChangeEventStatus(EventStatus? eventStatus, BuildContext context) {
    if (eventStatus != null) {
      final changeStatusEvent = ChangeStatusEventSheetEvent(
        eventModel: eventModel,
        eventStatus: eventStatus,
      );
      context.read<EventSheetBloc>().add(changeStatusEvent);
    }
  }

  void onTapRemoveEvent(BuildContext context) async {
    final eventSheetBloc = context.read<EventSheetBloc>();

    final isConfirmed = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => const ConfirmDialogRemoveEvent(),
    );

    if (isConfirmed ?? false) {
      final removeEvent = RemoveEventSheetEvent(eventModel: eventModel);
      eventSheetBloc.add(removeEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                  DropdownButton<EventStatus>(
                    isDense: true,
                    value: eventModel.eventStatus!,
                    icon: const Icon(FontAwesomeIcons.caretDown, size: 16),
                    items:
                        optionsEventStatus.map<DropdownMenuItem<EventStatus>>(
                      (e) {
                        return DropdownMenuItem<EventStatus>(
                          value: e,
                          child: ClipEventStatus(
                            eventStatus: e,
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (status) => onChangeEventStatus(status, context),
                  ),
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
                onTap: () => onTapRemoveEvent(context),
                backgroundColor: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
