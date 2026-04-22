import 'package:blood_donation_app/features/profile/bloc/profile_event.dart';
import 'package:blood_donation_app/features/profile/bloc/profile_state.dart';
import 'package:blood_donation_app/data/user_service.dart';
import 'package:blood_donation_app/features/profile/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(UserService userService) : super(ProfileState()) {
    on<SaveProfileEvent>((event, emit) async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null || event.bloodGroup.isEmpty || event.phone.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Authentication required. Please log in again.',
          ),
        );
        return;
      }

      emit(state.copyWith(isLoading: true, errorMessage: null));

      try {
        final userModel = UserModel(
          uid: user.uid,
          firstName: event.firstName,
          lastName: event.lastName,
          email: user.email ?? "",
          bloodGroup: event.bloodGroup,
          phone: event.phone,
          isDonor: event.isDonor,
          location: event.location.isEmpty ? "Unknown" : event.location,
        );

        await UserService().saveUser(userModel);

        // Emit success state with the updated user model directly
        emit(
          state.copyWith(
            user: userModel,
            profileState: ProfileStateVal.success,
            isLoading: false,
            isSuccess: true,
            profileErrorMessage: null,
            errorMessage: null,
          ),
        );

        // emit(
        //   state.copyWith(isLoading: false, isSuccess: true, errorMessage: null),
        // );
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to save profile: ${e.toString()}',
          ),
        );
      }
    });
    on<BloodGroupChanged>((event, emit) {
      emit(state.copyWith(bloodGroup: event.value, errorMessage: null));
    });
    on<ClearErrorEvent>((event, emit) {
      emit(state.copyWith(errorMessage: null, isSuccess: false));
    });
    // LoadProfileEvent handler
    on<LoadProfileEvent>(_ongetProfiledetails);
  }
  void _ongetProfiledetails(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        profileState: ProfileStateVal.loading,
        profileErrorMessage: null,
      ),
    );
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(
        state.copyWith(
          profileState: ProfileStateVal.error,
          profileErrorMessage: 'Authentication required. Please log in again.',
        ),
      );
      return;
    }

    try {
      final userDetails = await UserService().getUser(user.uid);

      if (userDetails != null) {
        emit(
          state.copyWith(
            user: userDetails,
            profileState: ProfileStateVal.success,
            profileErrorMessage: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            profileState: ProfileStateVal.error,
            profileErrorMessage: 'User profile not found.',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          profileState: ProfileStateVal.error,
          profileErrorMessage: 'Failed to load profile: ${e.toString()}',
        ),
      );
    }
  }
}
