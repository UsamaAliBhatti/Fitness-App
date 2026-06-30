part of 'plan_bloc.dart';

abstract class PlanEvent {
  const PlanEvent();
}

class LoadPlan extends PlanEvent {
  const LoadPlan();
}

class MoveWorkout extends PlanEvent {
  final ScheduledWorkout workout;

  final int targetWeekIndex;
  final int targetDayIndex;

  const MoveWorkout({
    required this.workout,
    required this.targetWeekIndex,
    required this.targetDayIndex,
  });
}