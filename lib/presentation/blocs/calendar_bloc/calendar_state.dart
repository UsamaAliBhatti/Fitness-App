part of 'calendar_bloc.dart';


class CalendarState extends Equatable {
  final DateTime? selectedDate;

  const CalendarState({
     this.selectedDate,
  });

  factory CalendarState.initial() {
    return CalendarState(
      selectedDate: DateTime.now(),
    );
  }

  CalendarState copyWith({
    DateTime? selectedDate,
  }) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  List<Object?> get props => [selectedDate];
}