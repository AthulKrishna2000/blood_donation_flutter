import 'package:bloc/bloc.dart';
import 'package:blood_donation_app/data/user_service.dart';
import 'package:blood_donation_app/features/profile/domain/user_model.dart';
import 'package:equatable/equatable.dart';

part 'donor_event.dart';
part 'donor_state.dart';

class DonorBloc extends Bloc<DonorEvent, DonorState> {
  final UserService userService;
  List<UserModel> allUsers = [];
  DonorBloc(this.userService) : super(DonorState()) {
    on<LoadDonorsEvent>(_loadDonors);
    on<FilterDonorsEvent>(_filterDonors);
  }
  void _loadDonors(LoadDonorsEvent event, Emitter<DonorState> emit) async {
    emit(state.copyWith(donorState: DonorStateVal.loading, errorMessage: null));
    try {
      final users = await userService.getAllUsers();
      allUsers = users;
      emit(state.copyWith(donors: users, donorState: DonorStateVal.success));
    } catch (e) {
      emit(
        state.copyWith(
          donorState: DonorStateVal.error,
          errorMessage: 'Failed to load donors: ${e.toString()}',
        ),
      );
    }
  }

  void _filterDonors(FilterDonorsEvent event, Emitter<DonorState> emit) {
    final filteredDonors = allUsers.where((user) {
      final matchesBloodGroup = user.bloodGroup == event.bloodGroup;

      return matchesBloodGroup;
    }).toList();

    emit(
      state.copyWith(donors: filteredDonors, donorState: DonorStateVal.success),
    );
  }
}
