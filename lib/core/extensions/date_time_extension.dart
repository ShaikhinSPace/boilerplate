// DateTime Extensions
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExt on DateTime {
  /// Returns true if given date is today
  bool get isToday {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    return DateTime(year, month, day) == today;
  }

  /// Returns true if given date is yesterday
  bool get isYesterday {
    final DateTime now = DateTime.now();
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    return DateTime(year, month, day) == yesterday;
  }

  /// Returns true if given date is tomorrow
  bool get isTomorrow {
    final DateTime now = DateTime.now();
    final DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    return DateTime(year, month, day) == tomorrow;
  }
}

/// return current time in milliseconds
int currentMillisecondsTimeStamp() => DateTime.now().millisecondsSinceEpoch;

/// return current timestamp
int currentTimeStamp() {
  return (DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt();
}

//Mon, Apr 22, 2024 5:26 PM  =
String getTimeAgo(String? date) {
  DateTime dateTime;
  String? timeAgoString;
  if (date != null) {
    dateTime = DateFormat('E, MMM dd, yyyy hh:mm a').parse(date);
    timeAgoString = timeago.format(dateTime, locale: 'en');
  }

  return timeAgoString ?? '--';
}

// 2024-05-07
String parseDateWithoutTime(String dateString) {
  DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
  return parseYearMonthDay(dateTime);
}

//Mon, Apr 22, 2024 5:26 PM
String parseFullDateTime(String date) {
  DateTime dateTime = DateFormat('E, MMM dd, yyyy hh:mm a').parse(date);
  return parseYearMonthDay(dateTime);
}

// 2024-05-07
(String weekDay, String dayNo) getWeekDay(String dateTime) {
  String weekDay = DateFormat('E').format(DateTime.parse(dateTime));
  String dayNo = DateFormat('d').format(DateTime.parse(dateTime));

  return (weekDay, dayNo);
}

String getMonthOnly(String date) {
  DateTime dateTime = DateTime.parse(date);
  DateTime month = DateTime.parse(parseYearMonthDay(dateTime));
  return DateFormat('MMMM').format(month);
}

String parseYearMonthDay(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

// Mon, May 07, 2024
String parseDate(String dateString) {
  DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
  return DateFormat('E, MMM dd, yyyy').format(dateTime);
}

/// return true if given year is an leap year
bool leapYear(int year) {
  bool leapYear = false;

  bool leap = ((year % 100 == 0) && (year % 400 != 0));
  if (leap == true) {
    leapYear = false;
  } else if (year % 4 == 0) {
    leapYear = true;
  }

  return leapYear;
}

/// returns number of days in given month
int daysInMonth(int monthNum, int year) {
  List<int> monthLength = List.filled(12, 0);

  monthLength[0] = 31;
  monthLength[2] = 31;
  monthLength[4] = 31;
  monthLength[6] = 31;
  monthLength[7] = 31;
  monthLength[9] = 31;
  monthLength[11] = 31;
  monthLength[3] = 30;
  monthLength[8] = 30;
  monthLength[5] = 30;
  monthLength[10] = 30;

  if (leapYear(year)) {
    monthLength[1] = 29;
  } else {
    monthLength[1] = 28;
  }

  return monthLength[monthNum - 1];
}
