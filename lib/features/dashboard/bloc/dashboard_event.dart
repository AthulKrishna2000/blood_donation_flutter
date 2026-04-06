part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}


class SelectTableEvent extends DashboardEvent {
  final int index;
const SelectTableEvent( {required this.index});
  @override
  List<Object> get props => [index];
}