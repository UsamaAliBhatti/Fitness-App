import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class WorkoutModel {
  /// Workout template id
  final String id;

  /// Example: Arm Blaster
  final String title;

  /// Example: Arms Workout
  final String category;

  /// Example: 25
  final int minDuration;

  /// Example: 30
  final int maxDuration;

  /// Left indicator color
  final Color indicatorColor;

  final SvgGenImage icon;

  const WorkoutModel({
    required this.id,
    required this.title,
    required this.category,
    required this.minDuration,
    required this.maxDuration,
    required this.indicatorColor,
    required this.icon,
  });

  WorkoutModel copyWith({
    String? id,
    String? title,
    String? category,
    int? minDuration,
    int? maxDuration,
    Color? indicatorColor,
    SvgGenImage? icon
  }) {
    return WorkoutModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      minDuration: minDuration ?? this.minDuration,
      maxDuration: maxDuration ?? this.maxDuration,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      icon: icon?? this.icon

    );
  }

  String get durationText => "$minDuration - ${maxDuration}m";
}
