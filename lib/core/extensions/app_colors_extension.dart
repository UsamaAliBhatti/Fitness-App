import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;

  final Color secondary;

  final Color background;
  final Color surface;
  final Color card;

  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;

  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Color border;
  final Color divider;

  final Color shadow;

  final Color iconPrimary;
  final Color iconSecondary;
  final Color borderSecondary;
  final Color gradientColorOne;
  final Color gradientColorTwo;
  final Color gradientColorThree;
  final Color bottomBorderColor;
  final Color whiteBlack;
  final Color cardBackground;

  const AppColorsExtension({
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.border,
    required this.divider,
    required this.shadow,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.borderSecondary,
    required this.gradientColorOne,
    required this.gradientColorTwo,
    required this.gradientColorThree,
    required this.bottomBorderColor,
    required this.whiteBlack,
    required this.cardBackground,
  });

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? card,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? border,
    Color? divider,
    Color? shadow,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? borderSecondary,
    Color? gradientColorOne,
    Color? gradientColorTwo,
    Color? gradientColorThree,
    Color? bottomBorderColor,
    Color? whiteBlack,
    Color? cardBackground,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      gradientColorOne: gradientColorOne ?? this.gradientColorOne,
      gradientColorTwo: gradientColorTwo ?? this.gradientColorTwo,
      gradientColorThree: gradientColorThree ?? this.gradientColorThree,
      bottomBorderColor: bottomBorderColor ?? this.bottomBorderColor,
      whiteBlack: whiteBlack ?? this.whiteBlack,
      cardBackground: cardBackground ?? this.cardBackground,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      bottomBorderColor: Color.lerp(
        bottomBorderColor,
        other.bottomBorderColor,
        t,
      )!,
      whiteBlack: Color.lerp(whiteBlack, other.whiteBlack, t)!,
      gradientColorOne: Color.lerp(
        gradientColorOne,
        other.gradientColorOne,
        t,
      )!,
      gradientColorTwo: Color.lerp(
        gradientColorTwo,
        other.gradientColorTwo,
        t,
      )!,
      gradientColorThree: Color.lerp(
        gradientColorThree,
        other.gradientColorThree,
        t,
      )!,
    );
  }
}
