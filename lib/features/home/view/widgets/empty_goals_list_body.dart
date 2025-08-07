import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';

class EmptyGoalsListBody extends StatelessWidget {
  const EmptyGoalsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'No goals yet start adding by clicking + New Goal button',
          style: AppTextStyles.primaryTextStyle,
          textAlign: TextAlign.center,
        ).tr(),
      ),
    );
  }
}
