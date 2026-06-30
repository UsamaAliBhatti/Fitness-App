import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/utils/app_shadow.dart';
import 'package:flutter/material.dart';

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        boxShadow: [AppShadow.drawShadow(context)],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '550',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Calories',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '1950 Remaining',
            style: TextStyle(color: context.colors.textSecondary, fontSize: 12),
          ),

          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: TextStyle(
                  color: context.colors.textSecondary,
                  fontSize: 10,
                ),
              ),
              Text(
                '2500',
                style: TextStyle(
                  color: context.colors.textSecondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          // Progress bar
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 550 / 2500,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        context.colors.gradientColorOne,
                        context.colors.gradientColorTwo,
                        context.colors.gradientColorThree,
                      ],
                    ),

                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
