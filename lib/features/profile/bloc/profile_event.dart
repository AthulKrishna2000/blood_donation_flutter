import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class SaveProfileEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String bloodGroup;
  final String phone;
  final String location;
  final bool isDonor;

  const SaveProfileEvent({
    required this.firstName,
    required this.lastName,
    required this.bloodGroup,
    required this.phone,
    required this.location,
    required this.isDonor,
  });

  @override
  List<Object?> get props => [firstName, lastName, bloodGroup, phone, location, isDonor];
}

class BloodGroupChanged extends ProfileEvent {
  final String value;
  const BloodGroupChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class ClearErrorEvent extends ProfileEvent {
  const ClearErrorEvent();
}

class LoadProfileEvent extends ProfileEvent {
  const LoadProfileEvent();
}
