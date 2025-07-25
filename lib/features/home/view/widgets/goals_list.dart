import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/goal_priority_enum.dart';
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

List<GoalModel> goals = [
  GoalModel(
    goalId: '1',
    title: 'Goal 1',
    progress: 20,
    description: '',
    notes: '',
    priority: GoalPriorityEnum.low.index,
  ),
  GoalModel(
    goalId: '2',
    title: 'Goal 2',
    progress: 30,
    description: '',
    notes: '',
    priority: GoalPriorityEnum.medium.index,
  ),
  GoalModel(
    goalId: '3',
    title: 'Goal 3',
    progress: 60,
    description: '',
    notes: '',
    priority: GoalPriorityEnum.high.index,
  ),
];
