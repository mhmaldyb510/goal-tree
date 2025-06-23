import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';

class AddNewGoalAppBar extends StatelessWidget {
  const AddNewGoalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('New Goal', style: AppTextStyles.appBarTitle).tr(),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
