import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';
import 'package:goal_tree/features/home/view/widgets/goals_list.dart';

class HomeScreenBody extends StatelessWidget {
  final List<GoalModel> goals;
  const HomeScreenBody({super.key, required this.goals});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        try {
          await context.read<HomeCubit>().getGoals();
        } catch (e) {
          log('Error refreshing goals: $e');
           if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to refresh goals: ${e.toString()}')),
            );
          }
        }
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('My Goals', style: AppTextStyles.headText).tr(),
            ),
          ),
          GoalsList(goals: goals),
        ],
      ),
    );
  }
}
