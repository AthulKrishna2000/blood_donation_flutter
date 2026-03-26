abstract class ProfileEvent {}

class SaveProfileEvent extends ProfileEvent {
  final String bloodGroup;
  final String phone;
  final String location;
  final bool isDonor;

  SaveProfileEvent({
    required this.bloodGroup,
    required this.phone,
    required this.location,
    required this.isDonor,
  });

  @override
  List<Object?> get props => [bloodGroup, phone, location, isDonor];
}

class BloodGroupChanged extends ProfileEvent {
  final String value;
  BloodGroupChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class ClearErrorEvent extends ProfileEvent {}
