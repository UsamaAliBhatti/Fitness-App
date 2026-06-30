import 'package:flutter/material.dart';
import 'app_colors_extension.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppColorsExtension get colors =>
      theme.extension<AppColorsExtension>()!;

  bool get isDark =>
      theme.brightness == Brightness.dark;

  bool get isLight =>
      !isDark;
}