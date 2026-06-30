import 'workout_model.dart';

class ScheduledWorkout {
  /// Unique scheduled workout id.
  final String id;

  /// Workout information.
  final WorkoutModel workout;

  const ScheduledWorkout({
    required this.id,
    required this.workout,
  });

  ScheduledWorkout copyWith({
    String? id,
    WorkoutModel? workout,
  }) {
    return ScheduledWorkout(
      id: id ?? this.id,
      workout: workout ?? this.workout,
    );
  }
}