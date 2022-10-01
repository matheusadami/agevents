import 'package:agevents/app/blocs/events/my.events.bloc.dart';
import 'package:agevents/app/blocs/events/my.events.event.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/date.helper.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterEventsDialog extends StatefulWidget {
  const FilterEventsDialog({super.key, required this.rootContext});

  final BuildContext rootContext;

  @override
  State<FilterEventsDialog> createState() => _FilterEventsDialogState();
}

class _FilterEventsDialogState extends State<FilterEventsDialog> {
  String errorMessage = '';

  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController initialDateController = TextEditingController(
    text: '',
  );

  final TextEditingController finalDateController = TextEditingController(
    text: '',
  );

  final List<EventType> optionsEventTypes = [
    EventType.personalEvent,
    EventType.studyEvent,
    EventType.workEvent,
  ];

  final List<EventPriority> optionsEventPriorities = [
    EventPriority.low,
    EventPriority.high,
  ];

  Future<String> openDatepicker(
    BuildContext context,
    String paramInitialDate,
  ) async {
    final initialDate = paramInitialDate.isEmpty
        ? DateTime.now()
        : DateHelper.createDateTimeFromBR(paramInitialDate);

    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 40),
      lastDate: DateTime(DateTime.now().year + 40),
    );

    if (picker != null) {
      return DateHelper.convertDateFromUSToBR(picker.toString());
    }

    return '';
  }

  void onTapInitialDate(BuildContext context) async {
    initialDateController.text = await openDatepicker(
      context,
      initialDateController.text,
    );
  }

  void onTapFinalDate(BuildContext context) async {
    finalDateController.text = await openDatepicker(
      context,
      finalDateController.text,
    );
  }

  void onTapFilterEvents(BuildContext context) {
    final eventName = nameController.text;
    final initialDate = initialDateController.text;
    final finalDate = finalDateController.text;

    if (eventName.isEmpty && initialDate.isEmpty && finalDate.isEmpty) {
      setState(() {
        errorMessage = 'Por favor informe ao menos um filtro';
      });
    } else {
      final searchEvents = SearchMyEventsEvent(
        paramName: eventName,
        paramFinalDate: finalDate,
        paramInitialDate: initialDate,
      );

      widget.rootContext.read<MyEventsBloc>().add(searchEvents);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            'Filtros',
            style: AppTextStyles.mediumDarkSemiBold,
          ),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormInputWidget(
                  hintText: 'Nome do Evento',
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormInputWidget(
                  hintText: 'Data Inicial',
                  controller: initialDateController,
                  keyboardType: TextInputType.none,
                  onTap: () => onTapInitialDate(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormInputWidget(
                  hintText: 'Data Final',
                  controller: finalDateController,
                  keyboardType: TextInputType.none,
                  onTap: () => onTapFinalDate(context),
                ),
              ),
              if (errorMessage.isNotEmpty)
                ErrorMessageFilterEventsDialog(
                  errorMessage: errorMessage,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: CommonButtonWidget(
                    label: 'Filtrar',
                    onTap: () => onTapFilterEvents(context),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}

class ErrorMessageFilterEventsDialog extends StatelessWidget {
  const ErrorMessageFilterEventsDialog({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: AppTextStyles.verySmallRedSemiBold,
    );
  }
}
