import 'package:flutter/material.dart';

import '../extensions/app_colors_extension.dart' show AppColorsExtension;

final lightColors = AppColorsExtension(
  primary: const Color(0xff20B76F),
  primaryLight: const Color(0xFFFFFFFF),
  primaryDark: const Color(0xFF1D4ED8),

  secondary: const Color(0xFF000000),

  background: const Color(0xffffffff),
  surface: Colors.white,
  card: Colors.white,

  textPrimary: const Color(0xff000000),
  textSecondary: const Color(0xff66667E),
  textDisabled: const Color(0xFF9CA3AF),

  success: const Color(0xFF16A34A),
  warning: const Color(0xFFF59E0B),
  error: const Color(0xFFDC2626),
  info: const Color(0xFF48A4E5),

  border: const Color(0xFFE5E7EB),
  divider: const Color(0xFFF1F5F9),

  shadow: Colors.black.withValues(alpha: 0.1),

  iconPrimary: const Color(0xFF000000),
  iconSecondary: const Color(0xFF6B7280),
  borderSecondary: const Color(0xff32AAB7),
  gradientColorOne: const Color(0xff7BBDE2),
  gradientColorTwo: const Color(0xff69C0B1),
  gradientColorThree: const Color(0xff60C198),
  bottomBorderColor: const Color(0xff1B3D45),
  whiteBlack: const Color(0xffffffff),
  cardBackground: const Color(0xffffffff),
);

final darkColors = AppColorsExtension(
  primary: const Color(0xff20B76F),
  primaryLight: const Color(0xFF93C5FD),
  primaryDark: const Color(0xFF2563EB),

  secondary: const Color(0xFFffffff),

  background: const Color(0xFF000000),
  surface: const Color(0xFF1E293B),
  card: const Color(0xFF273549),

  textPrimary: const Color(0xffffffff),
  textSecondary: const Color(0xff66667E),
  textDisabled: const Color(0xFF64748B),

  success: const Color(0xFF4ADE80),
  warning: const Color(0xFFFBBF24),
  error: const Color(0xFFF87171),
  info: const Color(0xFF48A4E5),

  border: const Color(0xFF334155),
  divider: const Color(0xFF475569),

  shadow: Colors.white.withValues(alpha: 0.1),

  iconPrimary: const Color(0xffffffff),
  iconSecondary: const Color(0xFF6B7280),
  borderSecondary: const Color(0xff32AAB7),

  gradientColorOne: const Color(0xff7BBDE2),
  gradientColorTwo: const Color(0xff69C0B1),
  gradientColorThree: const Color(0xff60C198),
  bottomBorderColor: const Color(0xff1B3D45),
  whiteBlack: const Color(0xff000000),
  cardBackground: const Color(0xff121212),
);
