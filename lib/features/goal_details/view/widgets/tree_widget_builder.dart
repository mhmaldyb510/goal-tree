import 'package:flutter/material.dart';
import 'package:goal_tree/features/goal_details/providers/goal_tree_provider.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_box.dart';
import 'package:graphview/GraphView.dart';
import 'package:provider/provider.dart';

class TreeWidgetBuilder extends StatelessWidget {
  const TreeWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoalTreeProvider>(context);
    return Expanded(
      child: provider.graph.nodes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(100),
              constrained: false,
              child: GraphView(
                graph: provider.graph,
                algorithm: BuchheimWalkerAlgorithm(
                  provider.builder,
                  TreeEdgeRenderer(provider.builder),
                ),
                builder: (node) {
                  int nodeId = node.key?.value ?? 0;
                  return GoalBox(
                    text: provider.nodeNames[nodeId] ?? node.key?.value ?? '',
                    isSelected: provider.selectedNode?.key == node.key,
                    onTap: () => provider.clickNode(node),
                    isDone: provider.doneNodes.contains(nodeId),
                  );
                },
              ),
            ),
    );
  }
}
