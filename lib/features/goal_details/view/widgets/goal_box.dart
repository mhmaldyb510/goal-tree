import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';

class GoalBox extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isDone;

  const GoalBox({
    super.key,
    required this.text,
    this.onTap,
    this.isSelected = false,
    this.isDone = false,
  });

  @override
  State<GoalBox> createState() => _GoalBoxState();
}

class _GoalBoxState extends State<GoalBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppConstants.kPrimaryColor),
          borderRadius: BorderRadius.circular(8),
          color: widget.isSelected ? Colors.grey : Colors.white,
        ),
        child: Text(
          widget.text,
          style: AppTextStyles.primaryTextStyle.copyWith(
            decoration: widget.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
