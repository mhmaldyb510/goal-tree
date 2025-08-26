import 'package:flutter/material.dart';
import 'package:goal_tree/features/goal_details/view/screens/goal_tree_screen.dart';
import 'package:provider/provider.dart';
import 'package:goal_tree/features/goal_details/providers/goal_tree_provider.dart';

class GoalTreePlaceholder extends StatelessWidget {
  const GoalTreePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final provider = Provider.of<GoalTreeProvider>(context, listen: false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: provider,
              child: const GoalTreeViewScreen(),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.blueGrey,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).width - 32,
          child: Image.asset('assets/images/goal-tree.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
