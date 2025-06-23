import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelAddingResourceButton extends StatelessWidget {
  final void Function()? onPressed;
  const CancelAddingResourceButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.kPrimaryColor,

        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.close),
          Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
