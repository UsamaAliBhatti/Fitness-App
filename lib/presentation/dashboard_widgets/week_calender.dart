
import 'package:fitness_app/core/utils/weejk_info.dart';
import 'package:fitness_app/presentation/dashboard_widgets/day_cell.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/extensions/theme_extension.dart';

class WeekCalendar extends StatelessWidget {
  final WeekInfo weekInfo;
  final DateTime selectedDate;

  const WeekCalendar({super.key, required this.weekInfo, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat("EEEE, d MMM yyyy").format(selectedDate),
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weekInfo.weekDates.map((date) {
            final isSelected = DateUtils.isSameDay(date, selectedDate);
            return DayCell(
              hasIndicator: isSelected,
              date: date,
              isActive: isSelected,
            );
          }).toList(),
        ),
      ],
    );
  }
}
