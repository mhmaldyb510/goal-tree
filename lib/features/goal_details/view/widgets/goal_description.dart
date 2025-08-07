import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';

class GoalDescription extends StatelessWidget {
  const GoalDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.primaryTextStyle,
    );
  }
}
