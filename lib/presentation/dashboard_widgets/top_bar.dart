import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/utils/weejk_info.dart';
import 'package:fitness_app/presentation/dashboard_widgets/week_selector.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final WeekInfo weekInfo;

  const TopBar({super.key, required this.weekInfo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.background,
      leadingWidth: 24,
      leading: Assets.icons.icNotification.svg(
        colorFilter: ColorFilter.mode(
          context.colors.iconPrimary,
          BlendMode.srcIn,
        ),
      ),

      centerTitle: true,
      title: WeekSelector(weekInfo: weekInfo),
    );
  }
}
