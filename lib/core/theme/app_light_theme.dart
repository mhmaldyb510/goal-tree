import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';

class AppLightTheme {
  ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppConstants.kPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppConstants.kPrimaryColor,
      surfaceContainerHighest: Color(0xfff1f2f4),
    ),
  );
}
