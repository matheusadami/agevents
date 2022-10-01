import 'package:agevents/app/models/event.model.dart';

abstract class MyEventsState {}

class InitialStateMyEventsState extends MyEventsState {}

class LoadingMyEventsState extends MyEventsState {}

class LoadedMyEventsState extends MyEventsState {
  final String paramName;
  final String paramFinalDate;
  final String paramInitialDate;
  final List<EventModel> events;

  LoadedMyEventsState({
    this.paramName = '',
    this.paramFinalDate = '',
    this.paramInitialDate = '',
    required this.events,
  });

  bool get isEmptyParams =>
      paramName.isEmpty && paramFinalDate.isEmpty && paramInitialDate.isEmpty;

  String buildLabelCurrentParams() {
    String label = '';

    if (paramName.isNotEmpty) {
      label += 'Nome: $paramName\n';
    }

    if (paramInitialDate.isNotEmpty) {
      if (paramFinalDate.isNotEmpty) {
        label += "Período: $paramInitialDate à $paramFinalDate\n";
      } else {
        label += "Período: A partir de $paramInitialDate\n";
      }
    } else if (paramFinalDate.isNotEmpty) {
      label += "Período: Anterior a $paramFinalDate\n";
    }

    return label;
  }
}

class ExceptionMyEventsState extends MyEventsState {
  final String message;

  ExceptionMyEventsState(this.message);
}
