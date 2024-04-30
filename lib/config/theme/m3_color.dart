import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class M3Color {
  static ColorScheme of(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static ColorScheme? darkScheme;
  static ColorScheme? lightScheme;
  static ColorScheme colorScheme(Brightness brightness) {
    return brightness == Brightness.dark ? darkScheme! : lightScheme!;
  }

  static Future<void> setScheme(Color seedColor) async {
    darkScheme = await M3Color.getScheme(true, seedColor);
    lightScheme = await M3Color.getScheme(false, seedColor);
  }

  static Future<ColorScheme> getScheme(bool isDarkMode, Color seedColor) {
    return compute(
        isDarkMode ? darkSchemeFromSeed : lightSchemeFromSeed, seedColor);
  }

  static ColorScheme darkSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );
  }

  static ColorScheme lightSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    );
  }
}
