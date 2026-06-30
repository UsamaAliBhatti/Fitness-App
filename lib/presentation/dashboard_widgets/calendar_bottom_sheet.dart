

import 'package:fitness_app/presentation/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late final DateRangePickerController _controller;

  late DateTime _displayDate;

  @override
  void initState() {
    super.initState();

    final selectedDate = context.read<CalendarBloc>().state.selectedDate;

    _displayDate = DateTime(
      selectedDate?.year ?? DateTime.now().year,
      selectedDate?.month ?? DateTime.now().month,
    );

    _controller = DateRangePickerController();
  }

  void _previousMonth() {
    _controller.backward?.call();

    setState(() {
      _displayDate = DateTime(_displayDate.year, _displayDate.month - 1);
    });
  }

  void _nextMonth() {
    _controller.forward?.call();

    setState(() {
      _displayDate = DateTime(_displayDate.year, _displayDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.read<CalendarBloc>().state.selectedDate;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF171717),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Drag Handle
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 20),

              /// Header
              Row(
                children: [
                  IconButton(
                    onPressed: _previousMonth,
                    icon: const Icon(Icons.chevron_left, color: Colors.white),
                  ),

                  Expanded(
                    child: Text(
                      DateFormat('MMM yyyy').format(_displayDate),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: _nextMonth,
                    icon: const Icon(Icons.chevron_right, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              SfDateRangePicker(
                controller: _controller,

                headerHeight: 0,

                navigationMode: DateRangePickerNavigationMode.none,

                showNavigationArrow: false,

                backgroundColor: Colors.transparent,

                initialSelectedDate: selectedDate,

                initialDisplayDate: selectedDate,

                selectionMode: DateRangePickerSelectionMode.single,

                monthViewSettings: const DateRangePickerMonthViewSettings(
                  firstDayOfWeek: 1,
                ),

                onViewChanged: (DateRangePickerViewChangedArgs args) {
                  final visibleMonth = DateTime(
                    args.visibleDateRange.startDate!.year,
                    args.visibleDateRange.startDate!.month,
                  );

                  if (_displayDate.year != visibleMonth.year ||
                      _displayDate.month != visibleMonth.month) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (!mounted) return;

                      setState(() {
                        _displayDate = visibleMonth;
                      });
                    });
                  }
                },

                onSelectionChanged: (args) {
                  final date = args.value as DateTime;

                  context.read<CalendarBloc>().add(SelectDate(date));

                  Navigator.pop(context);
                },

                monthCellStyle: const DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(color: Colors.white),
                  todayTextStyle: TextStyle(color: Colors.green),
                ),

                selectionColor: Colors.green,

                todayHighlightColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
