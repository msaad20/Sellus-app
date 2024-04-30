import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sellusapp/app.dart';
import 'package:sellusapp/app_localization.dart';
import 'package:sellusapp/provider_scope.dart';
import 'package:sellusapp/service_locator.dart';
import 'package:sellusapp/firebase_options.dart';
import 'package:sellusapp/state/providers/theme_provider.dart';
part 'initializer.dart';
part 'global.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _Initializer.load(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const AppLocalization(
      child: ProviderScope(
        child: App(),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}
