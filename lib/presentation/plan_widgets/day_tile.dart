import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/plan_bloc/plan_bloc.dart';
import '../models/scheduled_workouts.dart';
import 'plan_workout_card.dart';

class DayTile extends StatelessWidget {
  final int weekIndex;
  final int dayIndex;
  final DateTime date;
  final ScheduledWorkout? workout;

  const DayTile({
    super.key,
    required this.weekIndex,
    required this.dayIndex,
    required this.date,
    this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<ScheduledWorkout>(
      onWillAcceptWithDetails: (details) {
        // debugPrint('Hovering over Week $weekIndex Day $dayIndex');
        return true;
      },

      onAcceptWithDetails: (details) {
        // debugPrint(
        //   'Dropped ${details.data.id} on Week $weekIndex Day $dayIndex',
        // );

        context.read<PlanBloc>().add(
          MoveWorkout(
            workout: details.data,
            targetWeekIndex: weekIndex,
            targetDayIndex: dayIndex,
          ),
        );
      },

      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          // padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isHovering
                ? context.colors.primary.withValues(alpha: .08)
                : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Date
              SizedBox(
                width: 60,
                child: Column(
                  children: [
                    Text(
                      DateFormat('EEE').format(date),
                      style: TextStyle(
                        fontSize: 14,
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      "${date.day}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              /// Full-width drop area
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 82),
                  alignment: Alignment.centerLeft,
                  child: workout == null
                      ? Container(
                          width: double.infinity,
                          height: 82,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: candidateData.isNotEmpty
                                  ? context.colors.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        )
                      : LongPressDraggable<ScheduledWorkout>(
                          data: workout!,
                          maxSimultaneousDrags: 1,
                          dragAnchorStrategy: pointerDragAnchorStrategy,

                          feedback: SizedBox(
                            width: 320,
                            child: PlanWorkoutCard(workout: workout!.workout),
                          ),

                          childWhenDragging: Opacity(
                            opacity: .35,
                            child: PlanWorkoutCard(workout: workout!.workout),
                          ),

                          child: PlanWorkoutCard(workout: workout!.workout),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
