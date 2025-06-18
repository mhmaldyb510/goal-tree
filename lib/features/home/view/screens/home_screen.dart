import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:goal_tree/features/home/view/widgets/home_app_bar.dart';
import 'package:goal_tree/features/home/view/widgets/home_screen_body.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const HomeAppBar(),
      ),
      body: HomeScreenBody(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppConstants.kPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: () {},
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add),
            SizedBox(width: 8),
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
      ),
    );
  }
}
