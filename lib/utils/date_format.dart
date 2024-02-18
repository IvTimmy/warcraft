class DateFormatter {
  DateFormatter._();

  static String buildDay(DateTime time, {bool needWeek = true}) {
    if (needWeek) {
      return "${time.year}-${time.month}-${time.day} ${_getWeek(time.weekday)}";
    } else {
      return "${time.year}-${time.month}-${time.day}";
    }
  }

  static String buildHour(DateTime time) {
    String minute = time.minute > 10 ? "${time.minute}" : "0${time.minute}";
    return "${time.hour}:$minute";
  }

  static String buildSeconds(DateTime time) {
    String minute = time.minute > 10 ? "${time.minute}" : "0${time.minute}";
    String seconds = time.second > 10 ? "${time.second}" : "0${time.second}";
    return "${time.hour}:$minute:$seconds";
  }

  /// 判断是否为同一天
  static bool isSameDay(DateTime? time1, DateTime? time2) {
    return time1?.year == time2?.year &&
        time1?.month == time2?.month &&
        time1?.day == time2?.day;
  }

  static String _getWeek(int week) {
    switch (week) {
      case DateTime.monday:
        return "周一";
      case DateTime.tuesday:
        return "周二";
      case DateTime.wednesday:
        return "周三";
      case DateTime.thursday:
        return "周四";
      case DateTime.friday:
        return "周五";
      case DateTime.saturday:
        return "周六";
      case DateTime.sunday:
        return "周日";
    }
    return "";
  }
}
