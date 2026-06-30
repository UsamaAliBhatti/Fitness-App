import 'package:fitness_app/core/utils/weejk_info.dart';

class WeekUtils {
  static WeekInfo fromDate(
    DateTime selectedDate, {
    int firstDayOfWeek = DateTime.monday,
  }) {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);

    final lastDayOfMonth = DateTime(
      selectedDate.year,
      selectedDate.month + 1,
      0,
    );

    //----------------------------------------
    // Beginning of first week shown in calendar
    //----------------------------------------

    final firstWeekStart = firstDayOfMonth.subtract(
      Duration(days: (firstDayOfMonth.weekday - firstDayOfWeek + 7) % 7),
    );

    //----------------------------------------
    // Beginning of selected week
    //----------------------------------------

    final selectedWeekStart = selectedDate.subtract(
      Duration(days: (selectedDate.weekday - firstDayOfWeek + 7) % 7),
    );

    final selectedWeekEnd = selectedWeekStart.add(const Duration(days: 6));

    //----------------------------------------
    // Week number
    //----------------------------------------

    final weekNumber =
        (selectedWeekStart.difference(firstWeekStart).inDays ~/ 7) + 1;

    //----------------------------------------
    // Last week shown in calendar
    //----------------------------------------

    final lastWeekStart = lastDayOfMonth.subtract(
      Duration(days: (lastDayOfMonth.weekday - firstDayOfWeek + 7) % 7),
    );

    final totalWeeks =
        (lastWeekStart.difference(firstWeekStart).inDays ~/ 7) + 1;

    //----------------------------------------
    // Week Dates
    //----------------------------------------

    final weekDates = List.generate(
      7,
      (index) => selectedWeekStart.add(Duration(days: index)),
    );

    return WeekInfo(
      selectedDate: selectedDate,
      weekNumber: weekNumber,
      totalWeeks: totalWeeks,
      weekStart: selectedWeekStart,
      weekEnd: selectedWeekEnd,
      weekDates: weekDates,
    );
  }
}
