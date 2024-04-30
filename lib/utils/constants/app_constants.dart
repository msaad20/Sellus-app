import 'dart:ui';

class AppConstants {
  AppConstants._();
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
  ];
  static const Locale fallbackLocale = Locale('en');
   static const String  emailPattern= r"^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*$";

}
