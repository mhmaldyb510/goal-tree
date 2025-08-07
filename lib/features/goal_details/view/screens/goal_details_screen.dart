import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_description.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_details_app_bar.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_details_bottom_bar.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_title.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_tree_placeholder.dart';
import 'package:goal_tree/features/goal_details/view/widgets/information_table_builder.dart';
import 'package:goal_tree/features/goal_details/view/widgets/resources_list.dart';

class GoalDetailsScreen extends StatelessWidget {
  final GoalModel goal;

  const GoalDetailsScreen({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: GoalDetailsAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          GoalTitle(title: goal.title),
          SizedBox(height: 16),
          GoalDescription(description: goal.description),
          SizedBox(height: 16),
          InformationTableBuilder(goal: goal),
          SizedBox(height: 50),
          Text(
            '${(goal.progress).clamp(0.0, 100.0).toStringAsFixed(0)}%',
            style: AppTextStyles.primaryTextStyle,
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            color: Color(0xff121417),
            value: (goal.progress / 100).clamp(0.0, 1.0),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          SizedBox(height: 32),
          Text('Goal Tree', style: AppTextStyles.headText).tr(),
          SizedBox(height: 32),
          GoalTreePlaceholder(),
          SizedBox(height: 32),
          Text('Notes', style: AppTextStyles.headText).tr(),

          SizedBox(height: 12),
          goal.notes.isNotEmpty
              ? Text(goal.notes, style: AppTextStyles.secondaryTextStyle)
              : Text('No notes'.tr(), style: AppTextStyles.secondaryTextStyle),
          SizedBox(height: 32),
          Text('Resources', style: AppTextStyles.headText).tr(),
          SizedBox(height: 12),
          goal.resources.isNotEmpty
              ? ResourcesList(resources: goal.resources)
              : Text(
                  'No resources'.tr(),
                  style: AppTextStyles.secondaryTextStyle,
                ),
        ],
      ),
      bottomNavigationBar: GoalDetailsBottomBar(),
    );
  }
}
