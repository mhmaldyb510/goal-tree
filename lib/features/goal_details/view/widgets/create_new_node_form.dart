import 'package:flutter/material.dart';
import 'package:goal_tree/features/goal_details/providers/goal_tree_provider.dart';
import 'package:provider/provider.dart';

Future<dynamic> createNewNodeForm(BuildContext context) {
  final provider = Provider.of<GoalTreeProvider>(context, listen: false);
  String newNodeName = '';
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: TextField(
        autofocus: true,
        onChanged: (value) => newNodeName = value,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (newNodeName.isEmpty) return;
            await provider.createNewNode(provider.selectedNode!, newNodeName);

            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
