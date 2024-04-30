part of 'main.dart';

class _Initializer {
  static Future<void> load({
    FirebaseOptions? firebaseOptions,
  }) async {
    await _initialFirebase(firebaseOptions);
    setupLocator();
    await ThemeProvider().initialize();
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> _initialFirebase(
    FirebaseOptions? firebaseOptions,
  ) async {
    await Firebase.initializeApp(options: firebaseOptions);
  }
}
