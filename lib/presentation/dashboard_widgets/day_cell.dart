import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/presentation/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DayCell extends StatelessWidget {
  final DateTime date;
  final bool isActive;
  final bool hasIndicator;

  const DayCell({
    super.key,
    required this.date,
    required this.isActive,
    required this.hasIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.read<CalendarBloc>().add(SelectDate(date));
      },
      child: Column(
        children: [
          Text(
            DateFormat('E').format(date).toUpperCase(),
            style: TextStyle(
              color: isActive
                  ? context.colors.primary
                  : context.colors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 6),

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isActive
                  ? Border.all(color: context.colors.primary, width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: isActive
                      ? context.colors.primary
                      : context.colors.textSecondary,
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hasIndicator ? context.colors.primary : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
