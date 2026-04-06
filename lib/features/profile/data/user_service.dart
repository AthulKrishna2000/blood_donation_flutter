import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) async {
    await _firestore.collection("users").doc(user.uid).set(user.toMap());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await _firestore
        .collection("users")
        .doc(uid)
        .get(const GetOptions(source: Source.server));

    if (doc.exists) {
      final data = doc.data()!;
      return UserModel(
        uid: data["uid"],
        firstName: data["firstName"] ?? '',
        lastName: data["lastName"] ?? '',
        email: data["email"] ?? '',
        bloodGroup: data["bloodGroup"] ?? '',
        phone: data["phone"] ?? '',
        location: data["location"] ?? '',
        isDonor: data["isDonor"] ?? false,
      );
    }
    return null;
  }
}
