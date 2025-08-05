import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';


class CreateNewGoalButton extends StatelessWidget {
  const CreateNewGoalButton({
    super.key,
    this.onPressed

  }) ;

  final VoidCallback? onPressed;



  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppConstants.kPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        side: BorderSide(),
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
      ),
      onPressed: onPressed,
      child: Text('Add new Goal'),
    );
  }
}
