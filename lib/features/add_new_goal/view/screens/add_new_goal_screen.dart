import 'package:flutter/material.dart';
import 'package:goal_tree/features/add_new_goal/providers/goal_resources_provider.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_app_bar.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_form.dart';
import 'package:provider/provider.dart';

class AddNewGoalScreen extends StatelessWidget {
  const AddNewGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const AddNewGoalAppBar(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => GoalResourcesProvider(),
        child: AddNewGoalForm(),
      ),
    );
  }
}
