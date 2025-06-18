import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalTile extends StatelessWidget {
  final GoalModel goal;
  const GoalTile({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Color(0xffF0F2F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.account_tree_outlined),
      ),
      title: Text(
        goal.title,
        style: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        'progress ${goal.progress}%',
        style: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 14,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
