import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/helpers/object_box.dart';
import 'package:goal_tree/features/home/view/screens/home_screen.dart';



late final ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  objectBox = await ObjectBox.create();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')],
      fallbackLocale: Locale('en'),
      path: 'assets/translations',
      child: const GoalTree(),
    ),
  );
}

class GoalTree extends StatelessWidget {
  const GoalTree({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Goal Tree', home: HomeScreen());
  }
}
