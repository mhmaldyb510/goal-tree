import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_priority_enum.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/priority_box.dart';

class PriorityList extends StatefulWidget {
  const PriorityList({super.key, this.onPriorityChanged});
  // create the Value change function to change the priority in every click
  final ValueChanged<GoalPriorityEnum>? onPriorityChanged;

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
            widget.onPriorityChanged?.call(value);
          },
        ),
        PriorityBox(
          priority: GoalPriorityEnum.medium,
          isSelected: selectedPriority == GoalPriorityEnum.medium,
          onSelected: (value) {
            setState(() {
              selectedPriority = value;
            });
            widget.onPriorityChanged?.call(value);
          },
        ),
        PriorityBox(
          priority: GoalPriorityEnum.low,
          isSelected: selectedPriority == GoalPriorityEnum.low,
          onSelected: (value) {
            setState(() {
              selectedPriority = value;
            });
            widget.onPriorityChanged?.call(value);
          },
        ),
      ],
    );
  }
}
