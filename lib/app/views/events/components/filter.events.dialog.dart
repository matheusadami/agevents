import 'package:agevents/core/components/clip.event.priority.dart';
import 'package:agevents/core/components/clip.event.type.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/helpers/date.helper.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterEventsDialog extends StatefulWidget {
  const FilterEventsDialog({super.key});

  @override
  State<FilterEventsDialog> createState() => _FilterEventsDialogState();
}

class _FilterEventsDialogState extends State<FilterEventsDialog> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController finalDateController = TextEditingController(
    text: '',
  );

  final TextEditingController initialDateController = TextEditingController(
    text: '',
  );

  EventType? eventType;

  EventPriority? eventPriority;

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
      firstDate: DateTime.now(),
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
      initialDateController.text,
    );
  }

  void onTapFilterEvents(BuildContext context) {}

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton<EventType>(
                  isExpanded: true,
                  hint: Text(
                    'Categoria do Evento',
                    style: AppTextStyles.verySmallDarGraykSemiBold,
                  ),
                  value: eventType,
                  icon: const Icon(FontAwesomeIcons.caretDown, size: 16),
                  items: optionsEventTypes.map<DropdownMenuItem<EventType>>(
                    (e) {
                      return DropdownMenuItem<EventType>(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ClipEventType(
                            eventType: e,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() => eventType = value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton<EventPriority>(
                  isExpanded: true,
                  hint: Text(
                    'Prioridade do Evento',
                    style: AppTextStyles.verySmallDarGraykSemiBold,
                  ),
                  value: eventPriority,
                  icon: const Icon(FontAwesomeIcons.caretDown, size: 16),
                  items: optionsEventPriorities
                      .map<DropdownMenuItem<EventPriority>>(
                    (e) {
                      return DropdownMenuItem<EventPriority>(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ClipEventPriority(
                            eventPriority: e,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() => eventPriority = value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: CommonButtonWidget(
                    label: 'Entrar',
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
