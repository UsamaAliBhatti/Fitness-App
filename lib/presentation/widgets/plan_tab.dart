import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/plan_bloc/plan_bloc.dart';
import '../plan_widgets/week_section.dart';

class PlanTab extends StatelessWidget {
  const PlanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.background,
        title: Text(
          "Training Calendar",
          style: TextStyle(
            fontSize: 24,
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Text(
            "Save",
            style: TextStyle(
              fontSize: 18,
              color: context.colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: BlocBuilder<PlanBloc, PlanState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: state.weeks.length,
            itemBuilder: (context, index) {
              return WeekSection(weekIndex: index, week: state.weeks[index]);
            },
          );
        },
      ),
    );
  }
}
