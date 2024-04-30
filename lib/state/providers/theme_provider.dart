import 'package:flutter/material.dart';
import 'package:sellusapp/config/theme/m3_color.dart';
import 'package:sellusapp/config/theme/theme_constants.dart';
import 'package:sellusapp/core/storages/local_storage/theme_storage.dart';

class ThemeProvider extends ChangeNotifier {
  static final themeStorage = ThemeStorage();
  static ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;
  Future<void> initialize() async {
    M3Color.setScheme(ThemeConstants.primaryColor);
    _themeMode = await themeStorage.readObject();
  }

  Future<void> changeTheme(ThemeMode object) async {
    await themeStorage.writeObject(object);
  }
}
