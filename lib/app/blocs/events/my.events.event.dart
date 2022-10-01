import 'package:agevents/core/helpers/date.helper.dart';

abstract class MyEventsEvent {}

class SearchMyEventsEvent extends MyEventsEvent {
  String paramName;
  String paramFinalDate;
  String paramInitialDate;

  SearchMyEventsEvent({
    this.paramName = '',
    this.paramFinalDate = '',
    this.paramInitialDate = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': paramName,
      'finalDate': paramFinalDate.isNotEmpty
          ? DateHelper.convertDateFromBRToUS(paramFinalDate)
          : '',
      'initialDate': paramInitialDate.isNotEmpty
          ? DateHelper.convertDateFromBRToUS(paramInitialDate)
          : '',
    };
  }
}
