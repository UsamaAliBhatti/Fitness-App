import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/utils/app_shadow.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [AppShadow.drawShadow(context)],
        color: context.colors.cardBackground,
        borderRadius: BorderRadius.circular(14),

        border: Border(
          left: BorderSide(color: context.colors.borderSecondary, width: 5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'December 22 · 25m – 30m',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Upper Body',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Assets.icons.icArrow.svg(
            color: context.colors.iconPrimary,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
