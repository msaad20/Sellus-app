import 'package:get_it/get_it.dart';
import 'package:sellusapp/data/authentication/datasource/firebase_auth_source.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/providers/theme_provider.dart';

final GetIt sl = GetIt.I;

void setupLocator() {
  ///Datasource
  sl.registerSingleton<FirebaseAuthSource>(FirebaseAuthSource());

  ///Providers
  sl.registerSingleton<ThemeProvider>(ThemeProvider());

  /// Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
}
