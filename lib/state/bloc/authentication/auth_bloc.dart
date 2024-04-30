import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellusapp/config/router/router_args.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/data/authentication/datasource/firebase_auth_source.dart';
import 'package:sellusapp/data/authentication/models/auth_user.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  FirebaseAuthSource firebaseAuth;

  AuthBloc(this.firebaseAuth) : super(const InitializeAuthBlocState()) {
    on<AuthBlocEventSignup>(_authBlocEventSignup);
    on<AuthBlocEventSignin>(_authBlocEventSignin);
    on<AuthBlocEventSignOut>(_authBlocEventSignOut);
    on<AuthBlocEventDeleteUser>(_authBlocEventDeleteUser);
    on<AuthBlocEventSendVerifyEmail>(_authBlocEventSendVerifyEmail);
    on<AuthBlocEventIsEmailVerified>(_authBlocEventIsEmailVerified);
    on<AuthBlocEventResetPassword>(_authBlocEventResetPassword);
    on<AuthBlocEventGoogleSignin>(_authBlocEventGoogleSignin);
    on<AuthBlocEventInitialize>(_authBlocEventInitialize);
    on<AuthBlocEventAuthNavigation>(_authBlocEventAuthNavigation);
  }
  User? currentUser = FirebaseAuth.instance.currentUser;

  void _authBlocEventInitialize(
    AuthBlocEventInitialize event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const InitializeAuthBlocState(loading: true));
    final currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      emit(
        SignedInAuthBlocState(
          AuthUser.fromFirebase(firebaseUser: currentUser),
        ),
      );
    } else {
      emit(const SigninPageState());
    }
  }

  void _authBlocEventSignup(
    AuthBlocEventSignup event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(const UninitializedAuthBlocState(loading: true));
      final AuthUser? user = await firebaseAuth.createUser(
        email: event.email,
        password: event.password,
        userName: event.userName,
      );
      await firebaseAuth.sendEmailVerification();

      emit(AuthBlocPageState(route: SlRoutes.verifyEmail));
    } on Exception catch (e) {
      emit(UninitializedAuthBlocState(exception: e));
    }
  }

  void _authBlocEventSignin(
    AuthBlocEventSignin event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(const SigninPageState(loading: true));
      final AuthUser? user = await firebaseAuth.signInUser(
        email: event.email,
        password: event.password,
      );
      emit(SignedInAuthBlocState(user!));
    } on Exception catch (e) {
      emit(SigninPageState(exception: e));
    }
  }

  void _authBlocEventSignOut(
    AuthBlocEventSignOut event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(SignedInAuthBlocState(
        AuthUser.fromFirebase(firebaseUser: currentUser!),
        loading: true,
      ));
      await firebaseAuth.signOutUser();

      emit(const SigninPageState());
    } on Exception catch (e) {
      emit(
        SignedInAuthBlocState(
            AuthUser.fromFirebase(firebaseUser: firebaseAuth.currentUser),
            exception: e),
      );
    }
  }

  ///FIXME:  this process contains more work
  ///users won't be able to delete their account
  /// if the the last signin was a bit time ago
  /// they will have to signin again to delete their account
  /// they maybe redirected to signin page
  void _authBlocEventDeleteUser(
    AuthBlocEventDeleteUser event,
    Emitter<AuthBlocState> emit,
  ) async {
    // try {
    //   emit(const LoadingAuthBlocState());
    //   await firebaseAuth.deleteCurrentUser();
    // } on Exception catch (e) {
    //   emit(ErrorAuthBlocState(e));
    // }
  }

  void _authBlocEventSendVerifyEmail(
    AuthBlocEventSendVerifyEmail event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(const UninitializedAuthBlocState(loading: true));
      await firebaseAuth.sendEmailVerification();
      emit(const UninitializedAuthBlocState());
    } on Exception catch (e) {
      emit(UninitializedAuthBlocState(exception: e));
    }
  }

  void _authBlocEventIsEmailVerified(
    AuthBlocEventIsEmailVerified event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(const UninitializedAuthBlocState(loading: true));
      await firebaseAuth.checkIfEmailVerified();

      final user = FirebaseAuth.instance.currentUser!;

      final AuthUser authUser = AuthUser(
        emailAddress: user.email,
        uid: user.uid,
        userName: user.displayName,
        isEmailVerified: true,
      );
      emit(SignedInAuthBlocState(authUser, loading: false));
    } on Exception catch (e) {
      emit(UninitializedAuthBlocState(exception: e));
    }
  }

  void _authBlocEventResetPassword(
    AuthBlocEventResetPassword event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(const UninitializedAuthBlocState(loading: true));
      await firebaseAuth.sendResetPasswordEmail(email: event.email);

      emit(
        ResetEmailSendPageState(event.email),
      );
    } on Exception catch (e) {
      emit(UninitializedAuthBlocState(exception: e));
    }
  }

  void _authBlocEventGoogleSignin(
    AuthBlocEventGoogleSignin event,
    Emitter<AuthBlocState> emit,
  ) {
    // Handle Google signin logic using firebaseAuth
    // For example:
    // firebaseAuth.signInWithGoogle();
    // Emit new state based on result
  }
  void _authBlocEventAuthNavigation(
    AuthBlocEventAuthNavigation event,
    Emitter<AuthBlocState> emit,
  ) {
    if (event.route == SlRoutes.signUp.path) {
      emit(AuthBlocPageState(route: SlRoutes.signUp));
    } else if (event.route == SlRoutes.resetPassword.path) {
      emit(AuthBlocPageState(route: SlRoutes.resetPassword));
    } else if (event.route == SlRoutes.resetPasswordEmailSend.path) {
      emit(
        AuthBlocPageState(
          route: SlRoutes.resetPasswordEmailSend,
        ),
      );
    } else if (event.route == SlRoutes.verifyEmail.path) {
      emit(AuthBlocPageState(
        route: SlRoutes.verifyEmail,
      ));
    } else if (event.route == SlRoutes.signIn.path) {
      emit(AuthBlocPageState(
        route: SlRoutes.signIn,
      ));
    }
  }
}
