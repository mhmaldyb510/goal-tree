import 'package:flutter/material.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_app_bar.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_form.dart';

class AddNewGoalScreen extends StatelessWidget {
  const AddNewGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const AddNewGoalAppBar(),
      ),
      body: AddNewGoalForm(),
    );
  }
}
