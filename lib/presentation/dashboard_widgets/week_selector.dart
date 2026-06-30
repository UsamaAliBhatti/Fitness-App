import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/utils/weejk_info.dart';
import 'package:flutter/material.dart';

import 'calendar_bottom_sheet.dart';

class WeekSelector extends StatelessWidget {
  final WeekInfo weekInfo;

  const WeekSelector({super.key, required this.weekInfo});

  void showCalendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const CalendarBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        showCalendarBottomSheet(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.icMoon.svg(
            colorFilter: ColorFilter.mode(
              context.colors.iconPrimary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Week ${weekInfo.weekNumber}/${weekInfo.totalWeeks}',
            style: TextStyle(color: context.colors.textPrimary, fontSize: 16),
          ),
          SizedBox(width: 5),
          Assets.icons.icDropdown.svg(
            colorFilter: ColorFilter.mode(
              context.colors.iconPrimary,
              BlendMode.srcIn,
            ),
          ),

          // Icon(
          //   Icons.arrow_drop_down_rounded,
          //   color: context.colors.textPrimary,
          //   size: 20,

          //   fill: 0.8,
          // ),
        ],
      ),
    );
  }
}
