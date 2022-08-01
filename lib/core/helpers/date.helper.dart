class DateHelper {
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
}
