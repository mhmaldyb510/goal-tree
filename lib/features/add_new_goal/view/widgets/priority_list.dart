import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/priority_box.dart';

class PriorityList extends StatefulWidget {
  const PriorityList({super.key});

  @override
  State<PriorityList> createState() => _PriorityListState();
}

class _PriorityListState extends State<PriorityList> {
  GoalPriorityEnum selectedPriority = GoalPriorityEnum.medium;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: [
        PriorityBox(
          priority: GoalPriorityEnum.high,
          isSelected: selectedPriority == GoalPriorityEnum.high,
          onSelected: (value) {
            setState(() {
              selectedPriority = value;
            });
          },
        ),
        PriorityBox(
          priority: GoalPriorityEnum.medium,
          isSelected: selectedPriority == GoalPriorityEnum.medium,
          onSelected: (value) {
            setState(() {
              selectedPriority = value;
            });
          },
        ),
        PriorityBox(
          priority: GoalPriorityEnum.low,
          isSelected: selectedPriority == GoalPriorityEnum.low,
          onSelected: (value) {
            setState(() {
              selectedPriority = value;
            });
          },
        ),
      ],
    );
  }
}
