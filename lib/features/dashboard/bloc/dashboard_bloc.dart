import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<SelectTableEvent>(_selecttabindex);
  }
  void _selecttabindex(SelectTableEvent event, Emitter<DashboardState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
