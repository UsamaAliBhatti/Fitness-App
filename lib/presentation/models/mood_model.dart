import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum MoodType { happy, peaceful, content, calm }

class MoodModel {
  final MoodType type;
  final String title;
  final Color color;
  final SvgGenImage icon;
  final double angle;

  const MoodModel({
    required this.type,
    required this.title,
    required this.color,
    required this.icon,
    required this.angle,
  });
}

List<MoodModel> moods = [
  MoodModel(
    type: MoodType.happy,
    title: 'Happy',
    color: Color(0xFFFFA84E),
    icon: Assets.icons.moodHappy,
    angle: -90,
  ),
  MoodModel(
    type: MoodType.peaceful,
    title: 'Peaceful',
    color: Color(0xFF74DCCB),
    icon: Assets.icons.moodPeaceful,
    angle: 0,
  ),
  MoodModel(
    type: MoodType.content,
    title: 'Content',
    color: Color(0xFFF47BC0),
    icon: Assets.icons.moodContent,
    angle: 90,
  ),
  MoodModel(
    type: MoodType.calm,
    title: 'Calm',
    color: Color(0xFF9B8CFF),
    icon: Assets.icons.moodCalm,
    angle: 180,
  ),
];
