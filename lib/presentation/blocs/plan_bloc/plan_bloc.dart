import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../models/scheduled_workouts.dart';
import '../../models/training_day.dart';
import '../../models/training_week.dart';
import '../../models/workout_model.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(const PlanState(isLoading: true)) {
    on<LoadPlan>(_onLoadPlan);
    on<MoveWorkout>(_onMoveWorkout);
  }

  Future<void> _onLoadPlan(LoadPlan event, Emitter<PlanState> emit) async {
    emit(state.copyWith(isLoading: false, weeks: _dummyWeeks()));
  }

  void _onMoveWorkout(MoveWorkout event, Emitter<PlanState> emit) {
    final weeks = state.weeks.map((week) => week.copyWith()).toList();

    int? sourceWeekIndex;
    int? sourceDayIndex;
    ScheduledWorkout? movedWorkout;

    // Find the workout
    for (int w = 0; w < weeks.length; w++) {
      for (int d = 0; d < weeks[w].days.length; d++) {
        final workout = weeks[w].days[d].workout;

        if (workout?.id == event.workout.id) {
          sourceWeekIndex = w;
          sourceDayIndex = d;
          movedWorkout = workout;
          break;
        }
      }
      if (movedWorkout != null) break;
    }

    if (movedWorkout == null) return;

    // Don't do anything if dropped on the same day
    if (sourceWeekIndex == event.targetWeekIndex &&
        sourceDayIndex == event.targetDayIndex) {
      return;
    }

    // Remove from source
    final sourceDays = List<TrainingDay>.from(weeks[sourceWeekIndex!].days);
    sourceDays[sourceDayIndex!] = sourceDays[sourceDayIndex].copyWith(
      workout: null,
    );

    weeks[sourceWeekIndex] = weeks[sourceWeekIndex].copyWith(days: sourceDays);

    // Add to target
    final targetDays = List<TrainingDay>.from(
      weeks[event.targetWeekIndex].days,
    );

    targetDays[event.targetDayIndex] = targetDays[event.targetDayIndex]
        .copyWith(workout: movedWorkout);

    weeks[event.targetWeekIndex] = weeks[event.targetWeekIndex].copyWith(
      days: targetDays,
    );

    emit(state.copyWith(weeks: weeks));
  }

  List<TrainingWeek> _dummyWeeks() {
    return [
      _createWeek(weekNumber: 1, start: DateTime(2025, 12, 1)),
      _createWeek(weekNumber: 2, start: DateTime(2025, 12, 8)),
      _createWeek(weekNumber: 3, start: DateTime(2025, 12, 15)),
    ];
  }

  TrainingWeek _createWeek({required int weekNumber, required DateTime start}) {
    final armWorkout = WorkoutModel(
      id: '${weekNumber}_arm',
      title: 'Arm Blaster',
      category: 'Arms Workout',
      minDuration: 25,
      maxDuration: 30,
      indicatorColor: Color(0xff20B76F),
      icon: Assets.icons.icArm,
    );

    final legWorkout = WorkoutModel(
      id: '${weekNumber}_leg',
      title: 'Leg Day Blitz',
      category: 'Leg Workout',
      minDuration: 35,
      maxDuration: 40,
      indicatorColor: Color(0xff4855DF),
      icon: Assets.icons.icLeg,
    );

    return TrainingWeek(
      weekNumber: weekNumber,
      totalWeeks: 8,
      startDate: start,
      endDate: start.add(const Duration(days: 6)),
      days: List.generate(7, (index) {
        return TrainingDay(
          date: start.add(Duration(days: index)),
          workout: switch (index) {
            0 => ScheduledWorkout(
              id: '${weekNumber}_arm_$index',
              workout: armWorkout,
            ),
            3 => ScheduledWorkout(
              id: '${weekNumber}_leg_$index',
              workout: legWorkout,
            ),
            _ => null,
          },
        );
      }),
    );
  }
}
