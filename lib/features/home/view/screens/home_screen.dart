import 'package:flutter/material.dart';
import 'package:goal_tree/features/home/view/widgets/add_new_goal_action_button.dart';
import 'package:goal_tree/features/home/view/widgets/home_app_bar.dart';
import 'package:goal_tree/features/home/view/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const HomeAppBar(),
      ),
      body: HomeScreenBody(),
      floatingActionButton: AddNewGoalActionButton(),
    );
  }
}
