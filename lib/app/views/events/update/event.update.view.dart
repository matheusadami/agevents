import 'package:agevents/app/blocs/events/form/event.bloc.dart';
import 'package:agevents/app/blocs/events/form/event.event.dart';
import 'package:agevents/app/blocs/events/form/event.state.dart';
import 'package:agevents/app/views/events/components/dropdown.event.priority.dart';
import 'package:agevents/app/views/events/components/dropdown.event.type.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/common.loading.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/date.helper.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventUpdateViewArguments {
  final String eventId;

  EventUpdateViewArguments({required this.eventId});
}

class EventUpdateView extends StatelessWidget {
  const EventUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments;
    final eventArguments = (params as EventUpdateViewArguments);

    return BlocProvider<EventBloc>(
      create: (context) => EventBloc()
        ..add(
          LoadEventUpdateEventEvent(eventArguments.eventId),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Alterar Evento',
            style: AppTextStyles.mediumDarkSemiBold,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: BlocConsumer<EventBloc, EventState>(
          listener: (context, state) {
            if (state is SuccessUpdatedEventState) {
              Navigator.pop<bool>(context, true);
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case FormEventState:
                return EventUpdateFormBody(
                  state: (state as FormEventState),
                  eventArguments: eventArguments,
                );
              case LoadingEventState:
                return const CommonLoadingWidget();
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class EventUpdateFormBody extends StatelessWidget {
  const EventUpdateFormBody({
    super.key,
    required this.state,
    required this.eventArguments,
  });

  final FormEventState state;
  final EventUpdateViewArguments eventArguments;

  void onTapChooseDate(BuildContext context) async {
    state.dateController.text = await DateHelper.openDatePicker(
      state.dateController.text,
      context,
    );
  }

  void onChangeEventType(EventType? eventType) {
    state.eventTypeController.sink.add(eventType);
  }

  void onChangeEventPriority(EventPriority? eventPriority) {
    state.eventPriorityController.sink.add(eventPriority);
  }

  dynamic onTapUpdate(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      final currentContext = context.read<EventBloc>();
      final eventType = state.eventTypeController.valueOrNull;
      final eventPriority = state.eventPriorityController.valueOrNull;

      final messageEventType = await state.validatorEventType(eventType);
      if (messageEventType?.isNotEmpty ?? false) {
        return AlertsHelper.showWarnSnackBar(messageEventType!);
      }

      final messageEventPriority = await state.validatorEventPriority(
        eventPriority,
      );
      if (messageEventPriority?.isNotEmpty ?? false) {
        return AlertsHelper.showWarnSnackBar(messageEventPriority!);
      }

      currentContext.add(
        SubmitFormUpdateEventEvent(
          id: eventArguments.eventId,
          name: state.nameController.text,
          date: state.dateController.text,
          description: state.descriptionController.text,
          eventType: eventType!,
          eventPriority: eventPriority!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormInputWidget(
                  hintText: 'Nome',
                  helperText: 'Informe o nome do evento',
                  controller: state.nameController,
                  validator: (value) => state.validatorName(value ?? ''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormInputWidget(
                  icon: FontAwesomeIcons.solidCalendarCheck,
                  hintText: 'Data',
                  helperText: 'Informe a data do evento',
                  controller: state.dateController,
                  validator: (value) => state.validatorDate(value ?? ''),
                  onTap: () => onTapChooseDate(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormInputWidget(
                  hintText: 'Descrição',
                  helperText: 'Informe a descrição do evento',
                  controller: state.descriptionController,
                  isTextArea: true,
                  validator: (value) => state.validatorDescription(
                    value ?? '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selecione a Categoria',
                      style: AppTextStyles.smallDarkSemiBold,
                    ),
                    StreamBuilder<EventType?>(
                      stream: state.eventTypeController.stream,
                      builder: (context, snapshot) {
                        return DropdownEventType(
                          onChange: onChangeEventType,
                          eventType: snapshot.data,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selecione a Prioridade',
                      style: AppTextStyles.smallDarkSemiBold,
                    ),
                    StreamBuilder<EventPriority?>(
                      stream: state.eventPriorityController.stream,
                      builder: (context, snapshot) {
                        return DropdownEventPriority(
                          onChange: onChangeEventPriority,
                          eventType: snapshot.data,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: CommonButtonWidget(
                    label: 'Alterar',
                    onTap: () => onTapUpdate(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
