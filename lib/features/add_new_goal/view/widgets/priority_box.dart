import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/helpers/capitalize_string.dart';
import 'package:goal_tree/features/add_new_goal/model/goal_priority_enum.dart';
import 'package:google_fonts/google_fonts.dart';

class PriorityBox extends StatelessWidget {
  final GoalPriorityEnum priority;
  final ValueChanged<GoalPriorityEnum>? onSelected;
  final bool isSelected;
  const PriorityBox({
    super.key,
    required this.priority,
    this.onSelected,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected?.call(priority),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : Colors.transparent,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          priority.name.capitalize(),
          style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 14,
          ),
        ).tr(),
      ),
    );
  }
}
