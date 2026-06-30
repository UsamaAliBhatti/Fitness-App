import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2563EB),
      secondary: Color(0xFFFF6B35),
      surface: Colors.white,
      error: Color(0xFFDC2626),
    ),

    scaffoldBackgroundColor: lightColors.background,

    extensions: [lightColors],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF60A5FA),
      secondary: Color(0xFFFFA726),
      surface: Color(0xFF1E293B),
      error: Color(0xFFF87171),
    ),

    scaffoldBackgroundColor: darkColors.background,

    extensions:  [darkColors],
  );
}
