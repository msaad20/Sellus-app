// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sellusapp/config/router/router_extension.dart';
// import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
// import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';

// class InitialPage extends StatelessWidget {
//   const InitialPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthBlocState>(builder: (context, state) {
//       String initialRoute() {
//         if (state is SignedOutAuthBlocState) {
//           return SlRoutes.signIn.path;
//         } else if (state is SignedInAuthBlocState) {
//           return SlRoutes.home.path;
//         } else if (state is NeedVerficationAuthBlocState) {
//           return SlRoutes.verifyEmail.path;
//         } else if (state is InitializeAuthBlocState) {
//           return SlRoutes.initialPage.path;
//         } else {
//           //replace with routes not found
//           return '/';
//         }
//       }
//     });
//   }
// }
