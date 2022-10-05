import 'package:flutter/material.dart';

class DateHelper {
  static String getCurrentDateUSFormat([Duration? duration]) {
    final currentDate =
        duration == null ? DateTime.now() : DateTime.now().add(duration);
    return currentDate.toString().substring(0, 10);
  }

  static String convertDateFromBRToUS(String dateTime) {
    final newDate = dateTime.substring(0, 10);
    return (newDate.split('/').reversed.toList()).join('-');
  }

  static String convertDateFromUSToBR(String dateTime) {
    final newDate = dateTime.substring(0, 10);
    return (newDate.split('-').reversed.toList()).join('/');
  }

  static DateTime createDateTimeFromBR(String date) {
    final newDate = date.split('/').reversed.toList();
    return DateTime(
      int.parse(newDate[0]),
      int.parse(newDate[1]),
      int.parse(newDate[2]),
    );
  }

  static Future<String> openDatePicker(
    String paramInitialDate,
    BuildContext context,
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

    return picker != null
        ? DateHelper.convertDateFromUSToBR(picker.toString())
        : '';
  }
}
