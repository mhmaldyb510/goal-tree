import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/features/goal_details/view/widgets/resource_tile.dart';

class ResourcesList extends StatelessWidget {
  final List<ResourceModel> resources;
  const ResourcesList({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resources.length,
      itemBuilder: (context, index) => ResourceTile(resource: resources[index]),
    );
  }
}
