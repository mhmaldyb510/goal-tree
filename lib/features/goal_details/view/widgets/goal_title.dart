import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';

class GoalTitle extends StatelessWidget {
  const GoalTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.headText);
  }
}
