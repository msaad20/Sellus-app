import 'package:flutter/material.dart';
import 'package:sellusapp/gen/fonts.gen.dart';

class ThemeConstants {
  ThemeConstants._();
  static const String titleFontFamily = FontFamily.quicksand;
  static const String normalFontFamily = FontFamily.montserrat;
  static const Color primaryColor = Color.fromRGBO(254, 126, 126, 1);

  static const Color textFieldColorLight = Color(0xffEFEFEF);
  static const Color textFieldColorDark = Color(0xFF272E3F);
  static const Color backgroundColorLight = Colors.white;
  static const Color secondaryColor = Color.fromARGB(19, 77, 93, 138);
  static const Color backgroundColorDark = Color.fromRGBO(30, 35, 48, 1);
  static const Color cardColorDark = Color.fromRGBO(31, 35, 48, 1);
  static const Color cardColorLight = Color.fromARGB(255, 218, 218, 218);

  static const Color errorBackground = Color.fromARGB(255, 255, 232, 232);
  static const Color navigationBarColorLight = Color(0xFFFFFFFF);
  static const Color navigationBarColorDark = Color.fromRGBO(30, 35, 48, 1);
  static const Color shimmerBackground = Color.fromRGBO(238, 238, 238, 1);
  static const Color shimmerForeground = Color.fromRGBO(189, 189, 189, 1);
}
