import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/utils/app_shadow.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 16),
      decoration: BoxDecoration(
        boxShadow: [AppShadow.drawShadow(context)],
        color: context.colors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '75',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'kg',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_outward_rounded,
                  size: 14,
                  color: context.colors.primary,
                ),
              ),
              SizedBox(width: 4),
              Text(
                '+1.6kg',
                style: TextStyle(
                  color: context.colors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          Text(
            'Weight',
            style: TextStyle(
              color: context.colors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
