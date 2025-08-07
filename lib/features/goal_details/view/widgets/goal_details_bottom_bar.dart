import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/goal_details/view/widgets/styles/goal_details_button_styles.dart';

class GoalDetailsBottomBar extends StatelessWidget {
  const GoalDetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              style: GoalDetailsButtonStyles.editButtonStyle,
              child: Text(
                'Edit Goal'.tr(),
                style: AppTextStyles.secondaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: GoalDetailsButtonStyles.completeButtonStyle,
              child: Text(
                'Mark Completed'.tr(),
                style: AppTextStyles.secondaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
