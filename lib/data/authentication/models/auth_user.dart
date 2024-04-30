import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String? uid;
  final String? emailAddress;
  final String? userName;
  final bool? isEmailVerified;
  const AuthUser({
    required this.uid,
    required this.emailAddress,
    this.userName,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase({
    required User? firebaseUser,
  }) {
    switch (firebaseUser) {
      case null:
        return const AuthUser(
          uid: null,
          emailAddress: null,
          isEmailVerified: null,
        );
      default:
        return AuthUser(
          uid: firebaseUser.uid,
          emailAddress: firebaseUser.email,
          userName: firebaseUser.displayName,
          isEmailVerified: firebaseUser.emailVerified,
        );
    }
  }
}
