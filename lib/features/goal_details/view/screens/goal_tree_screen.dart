import 'package:flutter/material.dart';
import 'package:goal_tree/features/goal_details/providers/goal_tree_provider.dart';
import 'package:goal_tree/features/goal_details/view/widgets/select_node_options.dart';
import 'package:goal_tree/features/goal_details/view/widgets/tree_widget_builder.dart';
import 'package:provider/provider.dart';

class GoalTreeViewScreen extends StatefulWidget {
  const GoalTreeViewScreen({super.key});

  @override
  State<GoalTreeViewScreen> createState() => _GoalTreeViewScreenState();
}

class _GoalTreeViewScreenState extends State<GoalTreeViewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GoalTreeProvider>(context, listen: false).createGraph();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoalTreeProvider>(context);
    return PopScope(
      canPop: provider.state != GoalTreeState.building,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              if (provider.selectedNode != null) const SelectNodeOptions(),
              const TreeWidgetBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
