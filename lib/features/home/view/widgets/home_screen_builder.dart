import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';
import 'package:goal_tree/features/home/view/widgets/empty_goals_list_body.dart';
import 'package:goal_tree/features/home/view/widgets/home_screen_body.dart';
import 'package:goal_tree/features/home/view/widgets/no_data_body.dart';

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeLoaded) {
          return context.read<HomeCubit>().goals.isEmpty
              ? EmptyGoalsListBody()
              : HomeScreenBody();
        }
        return NoDataBody();
      },
    );
  }
}
