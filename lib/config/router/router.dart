import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sellusapp/config/router/router_args.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';
import 'package:sellusapp/views/app/home/home_view.dart';
import 'package:sellusapp/views/authentication/reset_password_view/reset_password_send_view/password_send_view.dart';
import 'package:sellusapp/views/authentication/reset_password_view/reset_password_view.dart';
import 'package:sellusapp/views/authentication/sign_in_view/sign_in_view.dart';
import 'package:sellusapp/views/authentication/sign_up_view/sign_up_view.dart';
import 'package:sellusapp/views/authentication/verify_email_view/verify_email_view.dart';

final GoRouter router = GoRouter(
  initialLocation: SlRoutes.home.path,
  redirect: (context, state) {
    final AuthBlocState authState = context.read<AuthBloc>().state;
    if (authState is SignedInAuthBlocState) {
      if (state.matchedLocation == SlRoutes.signIn.path ||
          state.matchedLocation == SlRoutes.signUp.path ||
          state.matchedLocation == SlRoutes.verifyEmail.path) {
        return SlRoutes.home.path;
      }
    }
    if (authState is SigninPageState) {
      return SlRoutes.signIn.path;
    } else if (authState is AuthBlocPageState) {
      switch (authState.route) {
        case SlRoutes.signUp:
          return SlRoutes.signUp.path;
        case SlRoutes.verifyEmail:
          return SlRoutes.verifyEmail.path;
        case SlRoutes.resetPassword:
          return SlRoutes.resetPassword.path;
        case SlRoutes.resetPasswordEmailSend:
          return SlRoutes.resetPasswordEmailSend.path;
        case SlRoutes.signIn:
          return SlRoutes.signIn.path;
        default:
          return null;
      }
    }

    return null;
  },
  routes: [
    GoRoute(
      path: SlRoutes.home.path,
      name: SlRoutes.home.name,
      builder: (context, state) => const HomeView(),
      redirect: (context, state) {
        AuthBlocState authState = context.read<AuthBloc>().state;
        if (authState is SignedInAuthBlocState) {
          return SlRoutes.home.path;
        } else {
          return SlRoutes.signIn.path;
        }
      },
    ),
    GoRoute(
      path: SlRoutes.signIn.path,
      name: SlRoutes.signIn.name,
      builder: (context, state) => SigninView(),
    ),
    GoRoute(
      path: SlRoutes.signUp.path,
      name: SlRoutes.signUp.name,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: SlRoutes.resetPassword.path,
      name: SlRoutes.resetPassword.name,
      builder: (context, state) => const ResetPasswordView(),
    ),
    GoRoute(
        path: SlRoutes.resetPasswordEmailSend.path,
        name: SlRoutes.resetPasswordEmailSend.name,
        builder: (context, state) {
          final args = state.extra as ResetPasswordSendArgs?;
          if (args != null) {
            return ResetPasswordSendView(
              args: args,
            );
          } else {
            return Scaffold();
          }
        }),
    GoRoute(
      path: SlRoutes.verifyEmail.path,
      name: SlRoutes.verifyEmail.name,
      builder: (context, state) => const VerifyEmailView(),
    ),

    // GoRoute(
    //   path: SlRoutes.initialPage.path,
    //   name: SlRoutes.initialPage.path,
    //   builder: (context, state) => const InitialPage(),
    // ),
  ],
);

// class RouteManager {
//   static GoRouter router(BuildContext context) {
//     String initalRoute() {
//       String _initialRoute = '/';
//       BlocListener(listener: (context, state) {
//         if (state is SignedOutAuthBlocState) {
//           _initialRoute = SlRoutes.signIn.path;
//         } else if (state is SignedInAuthBlocState) {
//           _initialRoute = SlRoutes.home.path;
//         } else if (state is NeedVerficationAuthBlocState) {
//           _initialRoute = SlRoutes.verifyEmail.path;
//         } else if (state is InitializeAuthBlocState) {
//           _initialRoute = SlRoutes.initialPage.path;
//         } else {
//           //replace with routes not found
//           _initialRoute = '/';
//         }
//       });
//       return _initialRoute;
//     }

//     GoRouter _router = GoRouter(
//       initialLocation: initalRoute(),
//       routes: [
//         GoRoute(
//           path: SlRoutes.home.path,
//           name: SlRoutes.home.name,
//           builder: (context, state) => const HomeView(),
//           redirect: (context, state) {
//             AuthBlocState authState = context.read<AuthBloc>().state;
//             if (authState is SignedInAuthBlocState) {
//               return SlRoutes.home.path;
//             } else {
//               return SlRoutes.signIn.path;
//             }
//           },
//         ),
//         GoRoute(
//           path: SlRoutes.signIn.path,
//           name: SlRoutes.signIn.name,
//           builder: (context, state) => SigninView(),
//         ),
//         GoRoute(
//           path: SlRoutes.signUp.path,
//           name: SlRoutes.signUp.name,
//           builder: (context, state) => const SignupView(),
//         ),
//         GoRoute(
//           path: SlRoutes.resetPassword.path,
//           name: SlRoutes.resetPassword.name,
//           builder: (context, state) => const ResetPasswordView(),
//         ),
//         GoRoute(
//             path: SlRoutes.resetPasswordEmailSend.path,
//             name: SlRoutes.resetPasswordEmailSend.name,
//             builder: (context, state) {
//               final args = state.extra as ResetPasswordSendArgs?;
//               if (args != null) {
//                 return ResetPasswordSendView(
//                   args: args,
//                 );
//               } else {
//                 return Scaffold();
//               }
//             }),
//         GoRoute(
//           path: SlRoutes.verifyEmail.path,
//           name: SlRoutes.verifyEmail.name,
//           builder: (context, state) => const VerifyEmailView(),
//         ),
//         GoRoute(
//           path: SlRoutes.verifyEmailEmailSend.path,
//           name: SlRoutes.verifyEmailEmailSend.name,
//           builder: (context, state) => const VerifyEmailView(),
//         ),
//         // GoRoute(
//         //   path: SlRoutes.initialPage.path,
//         //   name: SlRoutes.initialPage.path,
//         //   builder: (context, state) => const InitialPage(),
//         // ),
//       ],
//     );
//     return _router;
//   }
// }
