// bottom_nav_state.dart

class BottomNavState {
  final int currentIndex;

  const BottomNavState({
    this.currentIndex = 0,
  });

  BottomNavState copyWith({
    int? currentIndex,
  }) {
    return BottomNavState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}