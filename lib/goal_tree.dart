import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:goal_tree/core/helpers/goals_storage_helper.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';
import 'package:goal_tree/features/home/view/screens/home_screen.dart';
import 'package:goal_tree/main.dart';

class GoalTree extends StatelessWidget {
  const GoalTree({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) =>
              HomeCubit(GoalsStorageHelper(objectBox.store))..getGoals(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Goal Tree',
        home: const HomeScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppConstants.kPrimaryColor,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
