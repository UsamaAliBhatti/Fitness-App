import 'package:fitness_app/core/extensions/theme_extension.dart';

import 'package:fitness_app/core/utils/week_utils.dart';
import 'package:fitness_app/presentation/dashboard_widgets/calories_card.dart';
import 'package:fitness_app/presentation/dashboard_widgets/section_header.dart';
import 'package:fitness_app/presentation/dashboard_widgets/top_bar.dart';
import 'package:fitness_app/presentation/dashboard_widgets/weight_card.dart';
import 'package:fitness_app/presentation/dashboard_widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calendar_bloc/calendar_bloc.dart';

import '../dashboard_widgets/hydration_card.dart';
import '../dashboard_widgets/week_calender.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            final selectedDate = state.selectedDate ?? DateTime.now();

            final weekInfo = WeekUtils.fromDate(selectedDate);
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        // Top Bar
                        TopBar(weekInfo: weekInfo),
                        const SizedBox(height: 16),
                        // Week Calendar
                        WeekCalendar(
                          weekInfo: weekInfo,
                          selectedDate: selectedDate,
                        ),
                        const SizedBox(height: 24),
                        // Workouts Section
                        SectionHeader(title: 'Workouts', showIcon: true),
                        const SizedBox(height: 12),
                        WorkoutCard(),
                        const SizedBox(height: 24),
                        // My Insights
                        SectionHeader(title: 'My Insights'),
                        const SizedBox(height: 12),
                        // Calories & Weight Row
                        Row(
                          children: [
                            Expanded(child: CaloriesCard()),
                            const SizedBox(width: 12),
                            Expanded(child: WeightCard()),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Hydration Card
                        HydrationCard(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),

                // Bottom Nav
              ],
            );
          },
        ),
      ),
    );
  }
}
