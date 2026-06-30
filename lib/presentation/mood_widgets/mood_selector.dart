import 'dart:math';

import 'package:fitness_app/presentation/models/mood_model.dart';
import 'package:flutter/material.dart';

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  static const double _size = 320;
  static const double _strokeWidth = 28;
  static const double _thumbSize = 52;

  static const double _ringRadius = (_size / 2) - (_strokeWidth / 2);

  late double _currentAngle;
  late MoodModel _selectedMood;

  @override
  void initState() {
    super.initState();
    _currentAngle = 0;
    _selectedMood = moods.first;
  }

  void _updateMood(Offset localPosition) {
    final center = const Offset(_size / 2, _size / 2);

    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;

    double angle = atan2(dy, dx) * 180 / pi;

    angle += 90;

    if (angle < 0) {
      angle += 360;
    }

    setState(() {
      _currentAngle = angle;
      _selectedMood = _moodFromAngle(angle);
    });
  }

  MoodModel _moodFromAngle(double angle) {
    if (angle >= 315 || angle < 45) {
      return moods.firstWhere((e) => e.type == MoodType.happy);
    }

    if (angle >= 45 && angle < 135) {
      return moods.firstWhere((e) => e.type == MoodType.peaceful);
    }

    if (angle >= 135 && angle < 225) {
      return moods.firstWhere((e) => e.type == MoodType.content);
    }

    return moods.firstWhere((e) => e.type == MoodType.calm);
  }

  Offset _thumbOffset() {
    final radians = (_currentAngle - 90) * pi / 180;

    return Offset(
      (_size / 2) + (_ringRadius * cos(radians)),
      (_size / 2) + (_ringRadius * sin(radians)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final thumb = _thumbOffset();

    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (details) => _updateMood(details.localPosition),
          onPanUpdate: (details) => _updateMood(details.localPosition),
          child: SizedBox(
            width: _size,
            height: _size,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size.square(_size),
                  painter: MoodRingPainter(strokeWidth: _strokeWidth),
                ),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 130,
                  height: 130,

                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: _selectedMood.icon.svg(),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  left: thumb.dx - (_thumbSize / 2),
                  top: thumb.dy - 60,
                  child: IgnorePointer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff202734),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _selectedMood.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  left: thumb.dx - (_thumbSize / 2),
                  top: thumb.dy - (_thumbSize / 2),
                  child: IgnorePointer(
                    child: Container(
                      width: _thumbSize,
                      height: _thumbSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .20),
                            blurRadius: 18,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, .25),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            _selectedMood.title,
            key: ValueKey(_selectedMood.title),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 32,
            ),
          ),
        ),
      ],
    );
  }
}

class MoodRingPainter extends CustomPainter {
  const MoodRingPainter({required this.strokeWidth});

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    // Radius is exactly the same one used by the thumb.
    final radius = (size.width / 2) - (strokeWidth / 2);

    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..shader = SweepGradient(
        startAngle: -pi / 2,
        endAngle: 3 * pi / 2,
        colors: const [
          Color(0xFFFFA84E),
          Color(0xFFFFC15A),
          Color(0xFF74DCCB),
          Color(0xFF8D96FF),
          Color(0xFFF47BC0),
          Color(0xFFFFA84E),
        ],
        stops: const [0.0, 0.18, 0.45, 0.68, 0.88, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);

    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white.withValues(alpha: .08), Colors.transparent],
      ).createShader(rect);

    canvas.drawCircle(center, radius + (strokeWidth / 2), glowPaint);

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.white.withValues(alpha: .06);

    canvas.drawCircle(center, radius, borderPaint);
  }

  @override
  bool shouldRepaint(covariant MoodRingPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth;
  }
}
