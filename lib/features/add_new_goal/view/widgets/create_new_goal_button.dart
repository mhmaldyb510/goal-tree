import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/goal_priority_enum.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';

class CreateNewGoalButton extends StatelessWidget {
  const CreateNewGoalButton({
    super.key,
    required this.formKey,
    required this.goalTitle,
    required this.goalDescription,
    required this.goalDeadline,
    required this.goalPriority,
    required this.goalNotes,
    required this.goalResources,
  }) ;

  final GlobalKey<FormState> formKey;
  final String goalTitle;
  final String goalDescription;
  final DateTime? goalDeadline;
  final GoalPriorityEnum goalPriority;
  final String? goalNotes;
  final List<ResourceModel> goalResources;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppConstants.kPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        side: BorderSide(),
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
      ),
      onPressed: () async {
        if (formKey.currentState?.validate() ?? false) {
          await context.read<HomeCubit>().addGoal(
            GoalModel(
              title: goalTitle,
              description: goalDescription,
              deadline: goalDeadline,
              priority: goalPriority.index,
              notes: goalNotes ?? '',
              initialResources: goalResources,
            ),
          );
          if (context.mounted) {
            Navigator.pop(context);
          }
        }
      },
      child: Text('Add new Goal'),
    );
  }
}
