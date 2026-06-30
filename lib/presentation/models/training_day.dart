import 'scheduled_workouts.dart';

class TrainingDay {
  final DateTime date;
  final ScheduledWorkout? workout;

  const TrainingDay({
    required this.date,
    this.workout,
  });

  TrainingDay copyWith({
    DateTime? date,
    Object? workout = _sentinel,
  }) {
    return TrainingDay(
      date: date ?? this.date,
      workout: identical(workout, _sentinel)
          ? this.workout
          : workout as ScheduledWorkout?,
    );
  }
}

const _sentinel = Object();