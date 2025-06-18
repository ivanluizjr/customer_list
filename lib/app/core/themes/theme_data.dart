import 'package:customer_list/app/core/themes/colors/app_colors_theme.dart';
import 'package:flutter/material.dart';

ThemeData _colorsTheme = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: const Color(0xFF2188FF),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF2F2F2),
  extensions: const [
    AppColorsTheme(
      mainColor: Color(0xFFF9E5D1),
      brown: Color(0xFFBB8668),
      darkGreen: Color(0xFF32574A),
      lightGreen: Color(0xFFDADBC7),
      red: Color(0xFFED3833),
      greyNeutral: Color(0xFF8E98A3),
      white: Colors.white,
      black: Colors.black,
    ),
  ],
);

final themeData = _colorsTheme;
