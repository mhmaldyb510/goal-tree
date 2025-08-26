import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:goal_tree/features/add_new_goal/view/screens/add_new_goal_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewGoalActionButton extends StatelessWidget {
  const AddNewGoalActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppConstants.kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {
        showCupertinoSheet(
          context: context,
          builder: (context) => const AddNewGoalScreen(),
        );
      },
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.add),
          const SizedBox(width: 8),
          Text(
            'New Goal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 16,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
