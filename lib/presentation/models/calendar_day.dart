import 'package:fitness_app/presentation/models/workout_model.dart';

class CalendarDay {
  final DateTime date;
  final List<WorkoutModel> workouts;

  CalendarDay({
    required this.date,
    required this.workouts,
  });

  CalendarDay copyWith({
    DateTime? date,
    List<WorkoutModel>? workouts,
  }) {
    return CalendarDay(
      date: date ?? this.date,
      workouts: workouts ?? this.workouts,
    );
  }
}