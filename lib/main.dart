import 'package:fitness_app/presentation/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:fitness_app/presentation/blocs/nav_cubit/bottom_nav_cubit.dart';
import 'package:fitness_app/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'presentation/views/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => CalendarBloc()),
        BlocProvider(create: (_) => PlanBloc()..add(LoadPlan())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const MainScreen(),
      ),
    );
  }
}
