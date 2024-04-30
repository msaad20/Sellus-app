import 'package:sellusapp/config/router/router_extension.dart';

abstract class AuthBlocEvent {
  const AuthBlocEvent();
}

class AuthBlocEventInitialize extends AuthBlocEvent {
  const AuthBlocEventInitialize();
}

class AuthBlocEventSignup extends AuthBlocEvent {
  final String email;
  final String password;
  final String userName;
  const AuthBlocEventSignup(
    this.email,
    this.password,
    this.userName,
  );
}

class AuthBlocEventSignin extends AuthBlocEvent {
  final String email;
  final String password;

  const AuthBlocEventSignin(this.email, this.password);
}

class AuthBlocEventSignOut extends AuthBlocEvent {
  const AuthBlocEventSignOut();
}

class AuthBlocEventDeleteUser extends AuthBlocEvent {
  const AuthBlocEventDeleteUser();
}

class AuthBlocEventSendVerifyEmail extends AuthBlocEvent {
  const AuthBlocEventSendVerifyEmail();
}

class AuthBlocEventIsEmailVerified extends AuthBlocEvent {
  const AuthBlocEventIsEmailVerified();
}

class AuthBlocEventResetPassword extends AuthBlocEvent {
  final String email;

  AuthBlocEventResetPassword(this.email);
}

class AuthBlocEventGoogleSignin extends AuthBlocEvent {
  const AuthBlocEventGoogleSignin();
}
// class AuthBlocEventUpdateUserName extends AuthBlocEvent{
//   final String userName;
//   const AuthBlocEventChangeUserName(
//     {required this.userName}
//   );
// }

class AuthBlocEventAuthNavigation extends AuthBlocEvent {
  final String route;
  AuthBlocEventAuthNavigation({required this.route});
}
