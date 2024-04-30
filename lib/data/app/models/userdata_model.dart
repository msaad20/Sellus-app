import 'package:firebase_auth/firebase_auth.dart';

class UserDataModel {
  final String? userName;
  final String? emailAddress;
  final String? uid;
  UserDataModel({
    required this.uid,
    required this.userName,
    required this.emailAddress,
  });

  factory UserDataModel.fromFirebase({
    required UserCredential user,
  }) {
    return UserDataModel(
      uid: user.user?.uid,
      userName: user.user?.displayName,
      emailAddress: user.user?.email,
    );
  }
  Map<String, dynamic> fromJson() {
    return {};
  }
}
