class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String bloodGroup;
  final String phone;
  final String location;
  final bool isDonor;

  const UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bloodGroup,
    required this.phone,
    required this.location,
    required this.isDonor,
  });

  const UserModel.empty()
    : uid = '',
      firstName = '',
      lastName = '',
      email = '',
      bloodGroup = '',
      phone = '',
      location = '',
      isDonor = false;

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "bloodGroup": bloodGroup,
      "phone": phone,
      "location": location,
      "isDonor": isDonor,
    };
  }
}
