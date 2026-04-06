part of 'dashboard_bloc.dart';

class DashboardState {
  final int selectedIndex;
  DashboardState({this.selectedIndex = 0});

  DashboardState copyWith({int? selectedIndex}) {
    return DashboardState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  List<Object> get props => [selectedIndex];
}
