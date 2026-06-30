class WeekInfo {
  /// Currently selected date.
  final DateTime selectedDate;

  /// Week number within the month.
  final int weekNumber;

  /// Total weeks in the month.
  final int totalWeeks;

  /// Monday of the selected week.
  final DateTime weekStart;

  /// Sunday of the selected week.
  final DateTime weekEnd;

  /// Seven dates displayed in the horizontal calendar.
  final List<DateTime> weekDates;

  const WeekInfo({
    required this.selectedDate,
    required this.weekNumber,
    required this.totalWeeks,
    required this.weekStart,
    required this.weekEnd,
    required this.weekDates,
  });
}