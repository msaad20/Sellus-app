import 'package:firebase_auth/firebase_auth.dart';
import 'package:sellusapp/data/app/datasource/firestore_userdata.dart';
import 'package:sellusapp/data/app/models/userdata_model.dart';
import 'package:sellusapp/data/authentication/models/auth_user.dart';
import 'package:easy_localization/easy_localization.dart';

class FirebaseAuthAdapter {
  FirebaseAuth get _instance => FirebaseAuth.instance;
  FirestoreUserData database = FirestoreUserData();
  Future<void> writeDatabase({
    required String id,
    required UserDataModel data,
  }) async {
    database.writeDoc(id: id, data: data);
  }

  //TODO: fix this
  Future<void> deleteDatabase() async {}

  Future<AuthUser?> createUser({
    required String email,
    required String password,
    required String userName,
  }) async {
    UserCredential userCred = await _instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((UserCredential userCredential) async {
      await _instance.currentUser!.updateDisplayName(userName);
      return userCredential;
    });
    final UserDataModel userDataModel = UserDataModel.fromFirebase(
      user: userCred,
    );
    await writeDatabase(
      id: userCred.user!.uid,
      data: userDataModel,
    );

    return AuthUser.fromFirebase(
      firebaseUser: userCred.user,
    );
  }

  Future<AuthUser?> signInUser({
    required String email,
    required String password,
  }) async {
    final credential = await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return AuthUser(
      uid: credential.user!.uid,
      emailAddress: credential.user!.email!,
      isEmailVerified: credential.user!.emailVerified,
    );
  }

  Future<AuthUser?> signInWithGoogle() async {}
  Future<void> signOutUser() async {
    await _instance.signOut();
  }

  Future<void> sendResetPasswordEmail({
    required String email,
  }) async {
    await _instance.sendPasswordResetEmail(email: email);
  }

  Future<void> sendEmailVerification() async {
    await _instance.currentUser!.sendEmailVerification();
  }

  Future<bool?> checkIfEmailVerified() async {
    final isEmailVerified = await _instance.currentUser!
        .reload()
        .then((value) => _instance.currentUser!.emailVerified);

    if (isEmailVerified == true) {
      return isEmailVerified;
    } else {
      throw Exception(tr('errorMessage.emailNotVerified'));
    }
  }

  Future<void> deleteCurrentUser() async {
    await _instance.currentUser!.delete().then((value) async {
      await deleteDatabase();
    });
  }

  Future<AuthUser?> updateUserEmail({required String email}) async {
    await _instance.currentUser!.verifyBeforeUpdateEmail(email);
    return AuthUser.fromFirebase(
      firebaseUser: _instance.currentUser,
    );
  }

  Future<AuthUser?> updateUserName({required String userName}) async {
    await _instance.currentUser!.updateDisplayName(userName);
    return AuthUser.fromFirebase(
      firebaseUser: _instance.currentUser,
    );
  }

  Future<AuthUser?> updateUserPassword({required String password}) async {
    await _instance.currentUser!.updatePassword(password);
    return AuthUser.fromFirebase(
      firebaseUser: _instance.currentUser,
    );
  }
}
