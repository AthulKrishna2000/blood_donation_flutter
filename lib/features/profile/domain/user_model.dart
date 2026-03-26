class UserModel {
  final String uid;
  final String email;
  final String bloodGroup;
  final String phone;
  final String location;
  final bool isDonor;

  UserModel({
    required this.uid,
    required this.email,
    required this.bloodGroup,
    required this.phone,
    required this.location,
    required this.isDonor,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "bloodGroup": bloodGroup,
      "phone": phone,
      "location": location,
      "isDonor": isDonor,
    };
  }
}
