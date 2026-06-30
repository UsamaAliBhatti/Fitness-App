import 'package:fitness_app/core/extensions/theme_extension.dart';
import 'package:fitness_app/presentation/mood_widgets/mood_selector.dart';
import 'package:flutter/material.dart';

class MoodTab extends StatefulWidget {
  const MoodTab({super.key});

  @override
  State<MoodTab> createState() => _MoodTabState();
}

class _MoodTabState extends State<MoodTab> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -1.25),
            radius: 1.45,
            colors: [
              context.colors.background,
              Color(0xFF587BC1).withValues(alpha: 0.8),

              context.colors.background,
            ],
            stops: [0.0, 0.20, 0.5],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Mood',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Start your day',
                  style: TextStyle(
                    color: context.colors.textSecondary,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'How are you feeling at the\nMoment?',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 1.15,
                  ),
                ),
                const Spacer(),
                const Center(child: MoodSelector()),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.textPrimary,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: context.colors.whiteBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
