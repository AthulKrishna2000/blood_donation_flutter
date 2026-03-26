class ProfileState {
  final String? bloodGroup;
  final String phone;
  final String location;
  final bool isLoading;
  final String? profileError;
  final bool isSuccess;
  final String? errorMessage;

  ProfileState({
    this.bloodGroup,
    this.phone = '',
    this.location = '',
    this.isLoading = false,
    this.profileError,
    this.isSuccess = false,
    this.errorMessage,
  });

  ProfileState copyWith({
    String? bloodGroup,
    String? phone,
    String? location,
    bool? isLoading,
    String? profileError,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ProfileState(
      bloodGroup: bloodGroup ?? this.bloodGroup,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      profileError: profileError ?? this.profileError,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
