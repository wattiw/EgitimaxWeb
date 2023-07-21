import 'package:flutter/material.dart';

class StepItem {
  final IconData icon;
  final StepState stepState;
  final bool isActive;
  final String title;
  final String subtitle;
  final Widget content;
  final String imagePath;

  StepItem({
    required this.icon,
    required this.stepState,
    required this.isActive,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.imagePath,
  });
}
