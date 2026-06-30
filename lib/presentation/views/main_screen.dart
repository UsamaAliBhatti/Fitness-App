import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/presentation/widgets/dashboard_tab.dart';
import 'package:fitness_app/presentation/widgets/mood_tab.dart';
import 'package:fitness_app/presentation/widgets/plan_tab.dart';
import 'package:fitness_app/presentation/widgets/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/gen/assets.gen.dart';
import '../blocs/nav_cubit/bottom_nav_cubit.dart';
import '../blocs/nav_cubit/bottom_nav_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = const [
      DashboardTab(),
      PlanTab(),
      MoodTab(),
      ProfileTab(),
    ];
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.colors.background,
            body: IndexedStack(index: state.currentIndex, children: pages),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: context.colors.background,
              currentIndex: state.currentIndex,
              selectedItemColor: context.colors.textPrimary,
              unselectedItemColor: context.colors.textSecondary,

              onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Assets.icons.icNutrition.svg(),
                  activeIcon: Assets.icons.icNutrition.svg(
                    colorFilter: ColorFilter.mode(
                      context.colors.iconPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Nutrition',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.icPlan.svg(),
                  activeIcon: Assets.icons.icPlan.svg(
                    colorFilter: ColorFilter.mode(
                      context.colors.iconPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Plan',
                ),
                BottomNavigationBarItem(
                  activeIcon: Assets.icons.icMood.svg(
                    colorFilter: ColorFilter.mode(
                      context.colors.iconPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  icon: Assets.icons.icMood.svg(),
                  label: 'Mood',
                ),
                BottomNavigationBarItem(
                  activeIcon: Assets.icons.icProfile.svg(
                    colorFilter: ColorFilter.mode(
                      context.colors.iconPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  icon: Assets.icons.icProfile.svg(),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
