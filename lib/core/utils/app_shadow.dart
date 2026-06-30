import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class AppShadow {
  static BoxShadow drawShadow(BuildContext context) => BoxShadow(
    color: context.colors.shadow,
    blurRadius: 12,
    spreadRadius: 0,
    offset: Offset(0, 4),
  );
}
