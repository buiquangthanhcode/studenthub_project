import 'package:easy_localization/easy_localization.dart';

DateTime stringToDateTime(String? dateString) {
  try {
    return DateFormat('dd/MM/yyyy').parse(dateString ?? '1970-01-01');
  } catch (error) {
    return DateTime.parse('1970-01-01');
  }
}

String formatDateTime(DateTime dateTime, {String? format}) {
  try {
    return DateFormat(format ?? 'dd/MM/yyyy').format(dateTime);
  } catch (error) {
    return 'Invalid';
  }
}

DateTime parseYearToDateTime(String yearString) {
  try {
    int year = int.parse(yearString);
    return DateTime(year, 1, 1); // Default month and day are set to January 1st
  } catch (error) {
    return DateTime.parse('1970-01-01');
  }
}

int calculateMonthDifference(DateTime start, DateTime end) {
  int monthsApart = (end.year - start.year) * 12 + end.month - start.month;

  if (end.day < start.day) {
    monthsApart--;
  }

  return monthsApart;
}