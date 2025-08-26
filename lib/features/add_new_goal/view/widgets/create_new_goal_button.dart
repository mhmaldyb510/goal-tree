import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';

class CreateNewGoalButton extends StatelessWidget {
  const CreateNewGoalButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppConstants.kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
      ),
      onPressed: onPressed,
      child: const Text('Add new Goal').tr(),
    );
  }
}
