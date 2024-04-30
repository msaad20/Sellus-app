import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sellusapp/config/router/router.dart';
import 'package:sellusapp/config/theme/theme_config.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';
import 'package:sellusapp/state/providers/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    context.read<AuthBloc>().add(const AuthBlocEventInitialize());
    return Consumer<ThemeProvider>(
      builder: (context, state, child) {
        return BlocListener<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            router.refresh();
          },
          child: MaterialApp.router(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            routerConfig: router,
            themeMode: themeProvider.themeMode,
            theme: ThemeConfig.light().themeData,
            darkTheme: ThemeConfig.dark().themeData,
          ),
        );
      },
    );
  }
}
