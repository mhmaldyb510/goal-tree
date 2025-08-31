import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/add_new_goal/providers/add_new_goal_provider.dart';

class ResourcesList extends StatefulWidget {
  const ResourcesList({super.key});

  @override
  State<ResourcesList> createState() => _ResourcesListState();
}

class _ResourcesListState extends State<ResourcesList> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddNewGoalProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        provider.goalResources.length,
        (index) => ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset('assets/icons/link_icon.svg'),
          ),
          title: Text(
            provider.goalResources[index].name,
            style: AppTextStyles.secondaryTextStyle,
          ),
          subtitle: Text(
            provider.goalResources[index].link,
            style: AppTextStyles.primaryTextStyle,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              provider.removeResource(provider.goalResources[index]);
            },
          ),
        ),
      ),
    );
  }
}
