import 'package:flutter/material.dart';
import 'package:goal_tree/features/goal_details/providers/goal_tree_provider.dart';
import 'package:goal_tree/features/goal_details/view/widgets/create_new_node_form.dart';
import 'package:provider/provider.dart';

class SelectNodeOptions extends StatelessWidget {
  const SelectNodeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoalTreeProvider>(context);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          provider.nodeNames[provider.selectedNode!.key!.value] ??
              provider.selectedNode!.key!.value,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 8),
        SelectNodeButton(
          onPressed: () async {
            
            await createNewNodeForm(context);
          },
          icon: Icons.add,
        ),
        const SizedBox(width: 8),
        SelectNodeButton(
          onPressed: () => provider.addToDone(provider.selectedNode!),
          icon: Icons.remove,
        ),
      ],
    );
  }
}

class SelectNodeButton extends StatelessWidget {
  const SelectNodeButton({super.key, this.onPressed, required this.icon});

  final VoidCallback? onPressed;

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: const BorderSide(width: 2),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
