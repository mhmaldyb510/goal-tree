import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/features/home/view/widgets/goal_tail.dart';

class GoalsList extends StatelessWidget {
  final List<GoalModel> goals;
  const GoalsList({super.key, required this.goals});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        return GoalTile(goal: goals[index]);
      },
    );
  }
}
