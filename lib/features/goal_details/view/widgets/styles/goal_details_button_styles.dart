import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';

class GoalDetailsButtonStyles {
  static final ButtonStyle editButtonStyle = TextButton.styleFrom(
    backgroundColor: const Color(0xffF0F2F5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static final ButtonStyle completeButtonStyle = TextButton.styleFrom(
    backgroundColor: AppConstants.kPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
