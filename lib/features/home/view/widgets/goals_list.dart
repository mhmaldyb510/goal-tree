import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/features/home/view/widgets/goal_tail.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({super.key});

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

List<GoalModel> goals = [
  GoalModel(title: 'Goal 1', progress: 20),
  GoalModel(title: 'Goal 2', progress: 30),
  GoalModel(title: 'Goal 3', progress: 60),
];
