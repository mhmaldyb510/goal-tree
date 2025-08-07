import 'package:flutter/material.dart';

class GoalTreePlaceholder extends StatelessWidget {
  const GoalTreePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.blueGrey,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).width - 32,
        child: Image.asset('assets/images/goal-tree.png', fit: BoxFit.cover),
      ),
    );
  }
}
