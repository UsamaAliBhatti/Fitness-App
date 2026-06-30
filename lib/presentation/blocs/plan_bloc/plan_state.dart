part of 'plan_bloc.dart';

class PlanState {
  final bool isLoading;

  /// Complete training program
  final List<TrainingWeek> weeks;

  const PlanState({
    this.isLoading = false,
    this.weeks = const [],
  });

  PlanState copyWith({
    bool? isLoading,
    List<TrainingWeek>? weeks,
  }) {
    return PlanState(
      isLoading: isLoading ?? this.isLoading,
      weeks: weeks ?? this.weeks,
    );
  }
}