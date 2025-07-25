import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';
import 'package:goal_tree/features/home/view/widgets/goals_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllGoals(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            return RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().getAllGoals(),
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'My Goals',
                        style: AppTextStyles.headText,
                      ).tr(),
                    ),
                  ),
                  GoalsList(goals: state.goals),
                ],
              ),
            );
          }
          return Center(
            child: IconButton(
              onPressed: () => context.read<HomeCubit>().getAllGoals(),
              icon: Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }
}
