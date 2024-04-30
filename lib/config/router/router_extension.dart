enum SlRoutes {
  home,
  signIn,
  signUp,
  resetPassword,
  resetPasswordEmailSend,
  verifyEmail,

  initialPage,
}

extension RouterExtension on SlRoutes {
  String get path {
    switch (this) {
      case SlRoutes.home:
        return '/';
      case SlRoutes.signIn:
        return '/signIn';
      case SlRoutes.signUp:
        return '/signUp';
      case SlRoutes.resetPassword:
        return '/resetPassword';
      case SlRoutes.resetPasswordEmailSend:
        return '/resetPasswordEmailSend';
      case SlRoutes.verifyEmail:
        return '/verifyEmail';

      case SlRoutes.initialPage:
        return '/initialPage';
    }
  }

  String get name {
    switch (this) {
      case SlRoutes.home:
        return 'home';
      case SlRoutes.signIn:
        return 'signIn';
      case SlRoutes.signUp:
        return 'signUp';
      case SlRoutes.resetPassword:
        return 'resetPassword';
      case SlRoutes.resetPasswordEmailSend:
        return 'resetPasswordEmailSend';
      case SlRoutes.verifyEmail:
        return 'verifyEmail';

      case SlRoutes.initialPage:
        return 'initialPage';
    }
  }
}
