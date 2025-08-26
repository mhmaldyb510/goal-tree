import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/features/goal_details/view/screens/goal_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalTile extends StatefulWidget {
  final GoalModel goal;
  const GoalTile({super.key, required this.goal});

  @override
  State<GoalTile> createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> {
  late GoalModel goal;
  @override
  void initState() {
    goal = widget.goal;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async{
       goal = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoalDetailsScreen(goal: goal),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: const Color(0xffF0F2F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.account_tree_outlined),
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
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
