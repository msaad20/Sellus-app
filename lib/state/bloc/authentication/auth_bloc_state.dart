import 'package:sellusapp/config/router/router_args.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/data/authentication/models/auth_user.dart';

abstract class AuthBlocState {
  final bool loading;
  final Exception? exception;
  const AuthBlocState({this.loading = false, this.exception});
}

class InitializeAuthBlocState extends AuthBlocState {
  const InitializeAuthBlocState({super.loading});
}

class SignedInAuthBlocState extends AuthBlocState {
  final AuthUser user;
  const SignedInAuthBlocState(this.user, {super.loading, super.exception});
}

class SigninPageState extends AuthBlocState {
  const SigninPageState({super.loading, super.exception});
}


class UninitializedAuthBlocState extends AuthBlocState {
  const UninitializedAuthBlocState({super.loading, super.exception});
}     
// class NeedVerficationAuthBlocState extends AuthBlocState {
//   const NeedVerficationAuthBlocState({super.loading, super.exception});
// }

class ResetEmailSendPageState extends AuthBlocState {
  final String email;
  const ResetEmailSendPageState(
    this.email, {
    super.loading,
    super.exception,
  });
}

class AuthBlocPageState extends AuthBlocState {
  final SlRoutes route;
  final RouterArgs? args;
  AuthBlocPageState({
   required this.route,
   this.args,
    super.loading,
    super.exception,
  });
}
