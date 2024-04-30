import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sellusapp/service_locator.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/state/providers/theme_provider.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) =>
                sl<AuthBloc>())
      ],
      child: _multiProvider(child: child),
    );
  }

  _multiProvider({required Widget child}) {
    return MultiProvider(
      providers: [
        ListenableProvider<ThemeProvider>(
          create: (context) => sl<ThemeProvider>(),
        ),
      ],
      child: child,
    );
  }
}
