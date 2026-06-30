import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState()) {
    on<SelectDate>(_onSelectDate);
  }

  void _onSelectDate(SelectDate event, Emitter<CalendarState> emit) {
    emit(state.copyWith(selectedDate: event.date));
  }
}
