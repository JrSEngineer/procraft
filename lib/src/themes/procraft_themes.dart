import 'package:flutter/material.dart';

abstract class ProcraftThemes {
  static ThemeData light() {
    return ThemeData(
      primaryColorLight: const Color(0xffF7F7F8),
      colorScheme: const ColorScheme(
        inversePrimary: Color(0xffF7F7F8),
        brightness: Brightness.light,
        primary: Color(0xff391D37),
        onPrimary: Color(0xff391D37),
        secondary: Color(0xff5D2C71),
        onSecondary: Color(0xffF7F7F8),
        error: Color(0xffB01A06),
        onError: Color(0xffB01A06),
        background: Color(0xffF7F7F8),
        onBackground: Color(0xff391D37),
        surface: Color(0xff5D2C71),
        onSurface: Color(0xff391D37),
        tertiary: Color(0xffD3C8D8),
      ),
      primaryTextTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 54,
          fontWeight: FontWeight.w600,
          color: Color(0xff391D37),
        ),
        displayMedium: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Color(0xff391D37),
        ),
        displaySmall: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w600,
          color: Color(0xff391D37),
        ),
        headlineLarge: TextStyle(
          fontSize: 54,
          fontWeight: FontWeight.w400,
          color: Color(0xff391D37),
        ),
        headlineMedium: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: Color(0xff391D37),
        ),
        headlineSmall: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w400,
          color: Color(0xff391D37),
        ),
        titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w300,
          color: Color(0xff391D37),
        ),
        titleMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w300,
          color: Color(0xff391D37),
        ),
        titleSmall: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: Color(0xff391D37),
        ),
        labelLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: Color(0xff391D37),
        ),
        labelMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xff391D37),
        ),
        labelSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xff391D37),
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xff391D37),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff391D37),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff391D37),
        ),
      ),
    );
  }
}
