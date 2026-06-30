import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/utils/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/training_week.dart';
import 'day_tile.dart';

class WeekSection extends StatelessWidget {
  final int weekIndex;
  final TrainingWeek week;

  const WeekSection({super.key, required this.weekIndex, required this.week});

  @override
  Widget build(BuildContext context) {
    final totalMinutes = 60;

    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Container(
            decoration: BoxDecoration(
              color: context.colors.cardBackground,
              boxShadow: [AppShadow.drawShadow(context)],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Week ${week.weekNumber}/${week.totalWeeks}",
                        style: TextStyle(
                          color: context.colors.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _weekRange(),
                        style: TextStyle(
                          color: context.colors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),

                  child: Text(
                    "Total: $totalMinutes min",
                    style: TextStyle(
                      color: context.colors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// IMPORTANT:
          /// Don't use ListView inside another ListView.
          Column(
            children: [
              for (int i = 0; i < week.days.length; i++) ...[
                DayTile(
                  key: ValueKey(
                    '${week.weekNumber}_${week.days[i].date.toIso8601String()}',
                  ),
                  weekIndex: weekIndex,
                  dayIndex: i,
                  date: week.days[i].date,
                  workout: week.days[i].workout,
                ),
                if (i != week.days.length - 1)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    color: context.colors.border,
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _weekRange() {
    final start = DateFormat('MMMM d').format(week.startDate);
    final end = DateFormat('d').format(week.endDate);

    return "$start - $end";
  }
}
