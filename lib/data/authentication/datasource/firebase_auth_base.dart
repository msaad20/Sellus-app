import 'package:firebase_auth/firebase_auth.dart';
import 'package:sellusapp/data/authentication/adapters/firebase_auth_adapter.dart';
import 'package:sellusapp/data/authentication/models/auth_user.dart';
import 'package:sellusapp/utils/exceptions/firebase_exceptions/firebase_failure.dart';

abstract class FirebaseAuthBase {
   User? currentUser = FirebaseAuth.instance.currentUser;

  Future<P?> execWrapper<P>(Future<P> Function() callback) async {
    try {
      P result = await callback();
      return result;
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorMessage.fromCode(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  FirebaseAuthAdapter get adapter => FirebaseAuthAdapter();
  Future<AuthUser?> createUser({
    required String email,
    required String password,
    required String userName,
  }) {
    return execWrapper<AuthUser?>(() {
      return adapter.createUser(
        email: email,
        password: password,
        userName: userName,
      );
    });
  }

  Future<AuthUser?> signInUser({
    required String email,
    required String password,
  }) {
    return execWrapper<AuthUser?>(() {
      return adapter.signInUser(
        email: email,
        password: password,
      );
    });
  }

  Future<AuthUser?> signInWithGoogle() {
    return execWrapper<AuthUser?>(() {
      return adapter.signInWithGoogle();
    });
  }

  Future<void> signOutUser() {
    return execWrapper<void>(() {
      return adapter.signOutUser();
    });
  }

  Future<void> sendResetPasswordEmail({
    required String email,
  }) {
    return execWrapper<void>(() {
      return adapter.sendResetPasswordEmail(email: email);
    });
  }

  Future<void> sendEmailVerification() {
    return execWrapper<void>(() {
      return adapter.sendEmailVerification();
    });
  }

  Future<bool?> checkIfEmailVerified() {
    return execWrapper<bool?>(() {
      return adapter.checkIfEmailVerified();
    });
  }

  Future<void> deleteCurrentUser() {
    return execWrapper<void>(() {
      return adapter.deleteCurrentUser();
    });
  }

  Future<AuthUser?> updateUserEmail({required String email}) {
    return execWrapper<AuthUser?>(() {
      return adapter.updateUserEmail(email: email);
    });
  }

  Future<AuthUser?> updateUserName({required String userName}) {
    return execWrapper<AuthUser?>(() {
      return adapter.updateUserName(userName: userName);
    });
  }

  Future<AuthUser?> updateUserPassword({required String password}) {
    return execWrapper<AuthUser?>(() {
      return adapter.updateUserPassword(password: password);
    });
  }
}
