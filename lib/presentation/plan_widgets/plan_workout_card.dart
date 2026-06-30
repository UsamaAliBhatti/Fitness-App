import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/utils/app_shadow.dart';
import 'package:flutter/material.dart';

import '../models/workout_model.dart';

class PlanWorkoutCard extends StatelessWidget {
  final WorkoutModel workout;
  final VoidCallback? onTap;

  const PlanWorkoutCard({super.key, required this.workout, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 84,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: context.colors.cardBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border(
              left: BorderSide(color: context.colors.textPrimary, width: 5),
            ),
            boxShadow: [AppShadow.drawShadow(context)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Drag Handle
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Assets.icons.icDots.svg(),
              ),

              /// Workout Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: workout.indicatorColor.withValues(
                              alpha: .15,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              workout.icon.svg(color: workout.indicatorColor),
                              Text(
                                workout.category,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: workout.indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    Text(
                      workout.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  workout.durationText,
                  style: TextStyle(
                    color: context.colors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
