import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/add_new_goal/providers/add_new_goal_provider.dart';
import 'package:provider/provider.dart';

class AddNewGoalAppBar extends StatelessWidget {
  const AddNewGoalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddNewGoalProvider>(context);
    return AppBar(
      title: Text('New Goal', style: AppTextStyles.appBarTitle).tr(),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: provider.isCreatingGoal
              ? null
              : () => provider.createGoal(context),
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}
