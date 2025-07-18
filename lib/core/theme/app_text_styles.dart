import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static final appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final headText = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final primaryTextStyle = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final secondaryTextStyle = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14,
  );
}
