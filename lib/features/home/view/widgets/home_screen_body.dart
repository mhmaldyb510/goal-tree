import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/features/home/view/widgets/goals_list.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'My Goals',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
          ),
        ),
        GoalsList(),
      ],
    );
  }
}
