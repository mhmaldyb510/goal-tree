import 'package:flutter/material.dart';
import 'package:goal_tree/features/home/view/widgets/add_new_goal_action_button.dart';
import 'package:goal_tree/features/home/view/widgets/home_app_bar.dart';
import 'package:goal_tree/features/home/view/widgets/home_screen_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: HomeScreenBuilder(),
      floatingActionButton: AddNewGoalActionButton(),
    );
  }
}
