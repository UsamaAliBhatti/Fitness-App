import 'training_day.dart';

class TrainingWeek {
  /// Example: Week 2/8 -> weekNumber = 2
  final int weekNumber;

  /// Total weeks in the training plan.
  final int totalWeeks;

  /// Example: December 8
  final DateTime startDate;

  /// Example: December 14
  final DateTime endDate;

  /// Monday -> Sunday
  final List<TrainingDay> days;

  const TrainingWeek({
    required this.weekNumber,
    required this.totalWeeks,
    required this.startDate,
    required this.endDate,
    required this.days,
  });

  TrainingWeek copyWith({
    int? weekNumber,
    int? totalWeeks,
    DateTime? startDate,
    DateTime? endDate,
    List<TrainingDay>? days,
  }) {
    return TrainingWeek(
      weekNumber: weekNumber ?? this.weekNumber,
      totalWeeks: totalWeeks ?? this.totalWeeks,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      days: days ?? this.days,
    );
  }

  /// Total workout duration for this week.
  Duration get totalDuration {
    int totalMinutes = 0;

    for (final day in days) {
      final scheduledWorkout = day.workout;

      if (scheduledWorkout != null) {
        // You can use maxDuration, minDuration,
        // or the average depending on your business logic.
        totalMinutes += scheduledWorkout.workout.maxDuration;
      }
    }

    return Duration(minutes: totalMinutes);
  }

  /// Returns true if this week contains at least one workout.
  bool get hasWorkouts =>
      days.any((day) => day.workout != null);
}