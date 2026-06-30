import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showIcon;

  const SectionHeader({super.key, required this.title, this.showIcon = false});

  bool get _isDayTime {
    final hour = DateTime.now().hour;
    return hour >= 6 && hour < 18;
  }

  @override
  Widget build(BuildContext context) {
    final isDayTime = _isDayTime;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showIcon)
          Row(
            children: [
              Icon(
                isDayTime ? Icons.wb_sunny_rounded : Icons.nightlight_round,
                color: isDayTime ? Colors.amber : context.colors.iconPrimary,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                '9°',
                style: TextStyle(
                  color: context.colors.textPrimary,
                  fontSize: 18,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
