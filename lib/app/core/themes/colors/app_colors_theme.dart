import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color mainColor;
  final Color brown;
  final Color darkGreen;
  final Color lightGreen;
  final Color red;
  final Color white;
  final Color black;
  final Color greyNeutral;

  const AppColorsTheme({
    required this.mainColor,
    required this.brown,
    required this.darkGreen,
    required this.red,
    required this.white,
    required this.black,
    required this.greyNeutral,
    required this.lightGreen,
  });

  static AppColorsTheme defaultTheme() {
    return const AppColorsTheme(
      mainColor: Color(0xFFF9E5D1),
      brown: Color(0xFFBB8668),
      darkGreen: Color(0xFF32574A),
      lightGreen: Color(0xFFDADBC7),
      red: Color(0xFFED3833),
      white: Colors.white,
      black: Colors.black,
      greyNeutral: Color(0xFF8E98A3),
    );
  }

  @override
  AppColorsTheme copyWith({
    Color? mainColor,
    Color? darkBlue,
    Color? lightGray,
    Color? red,
    Color? green,
    Color? white,
    Color? black,
    Color? greyNeutral,
    Color? brown,
    Color? darkGreen,
    Color? lightGreen,
  }) {
    return AppColorsTheme(
      mainColor: mainColor ?? this.mainColor,
      brown: brown ?? this.brown,
      darkGreen: darkGreen ?? this.darkGreen,
      red: red ?? this.red,
      white: white ?? this.white,
      black: black ?? this.black,
      greyNeutral: greyNeutral ?? this.greyNeutral,
      lightGreen: darkBlue ?? this.lightGreen,
    );
  }

  @override
  AppColorsTheme lerp(covariant AppColorsTheme? other, double t) {
    return AppColorsTheme(
      mainColor: Color.lerp(mainColor, other?.mainColor, t) ?? mainColor,
      brown: Color.lerp(brown, other?.brown, t) ?? brown,
      darkGreen: Color.lerp(darkGreen, other?.darkGreen, t) ?? darkGreen,
      lightGreen: Color.lerp(lightGreen, other?.lightGreen, t) ?? lightGreen,
      red: Color.lerp(red, other?.red, t) ?? red,
      white: Color.lerp(white, other?.white, t) ?? white,
      black: Color.lerp(black, other?.black, t) ?? black,
      greyNeutral:
          Color.lerp(greyNeutral, other?.greyNeutral, t) ?? greyNeutral,
    );
  }
}
