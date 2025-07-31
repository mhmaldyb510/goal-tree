import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';

class NoDataBody extends StatelessWidget {
  const NoDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.read<HomeCubit>().getGoals(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.refresh), Text('Refresh')],
        ),
      ),
    );
  }
}
