import 'package:blood_donation_app/features/profile/domain/user_model.dart';

enum ProfileStateVal { initial, loading, success, error }

extension ProfileStateValX on ProfileStateVal {
  bool get isInitial => this == ProfileStateVal.initial;
  bool get isLoading => this == ProfileStateVal.loading;
  bool get isSuccess => this == ProfileStateVal.success;
  bool get isError => this == ProfileStateVal.error;
}

class ProfileState {
  final String? bloodGroup;
  final String firstName;
  final String lastName;

  final String phone;
  final String location;
  final bool isLoading;
  final String? profileError;
  final bool isSuccess;
  final String? errorMessage;
  // Profile details
  final UserModel user;
  final ProfileStateVal profileState;
  final String? profileErrorMessage;

  const ProfileState({
    this.bloodGroup,
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.location = '',
    this.isLoading = false,
    this.profileError,
    this.isSuccess = false,
    this.errorMessage,
    //profile details
    this.profileErrorMessage,
    this.user = const UserModel.empty(),
    this.profileState = ProfileStateVal.initial,
  });

  ProfileState copyWith({
    String? bloodGroup,
    String? firstName,
    String? lastName,
    String? phone,
    String? location,
    bool? isLoading,
    String? profileError,
    bool? isSuccess,
    String? errorMessage,
    //profile details
    UserModel? user,
    ProfileStateVal? profileState,
    String? profileErrorMessage,
  }) {
    return ProfileState(
      bloodGroup: bloodGroup ?? this.bloodGroup,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,

      phone: phone ?? this.phone,
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      profileError: profileError ?? this.profileError,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      //profile details
      user: user ?? this.user,
      profileState: profileState ?? this.profileState,
      profileErrorMessage: profileErrorMessage ?? this.profileErrorMessage,
    );
  }

  List<Object?> get props => [
    bloodGroup,
    firstName,
    lastName,
    phone,
    location,
    isLoading,
    profileError,
    isSuccess,
    errorMessage,
    //profile details
    user,
    profileState,
    profileErrorMessage,
  ];
}
