import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/add_new_goal/model/goal_resources_provider.dart';

class ResourcesList extends StatefulWidget {
  const ResourcesList({super.key});

  @override
  State<ResourcesList> createState() => _ResourcesListState();
}

class _ResourcesListState extends State<ResourcesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        context.read<GoalResourcesProvider>().goalResources.length,
        (index) => ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Color(0xfff1f2f4),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(11),
            child: SvgPicture.asset('assets/icons/link_icon.svg'),
          ),
          title: Text(
            context.read<GoalResourcesProvider>().goalResources[index].name,
            style: AppTextStyles.secondaryTextStyle,
          ),
          subtitle: Text(
            context.read<GoalResourcesProvider>().goalResources[index].link,
            style: AppTextStyles.primaryTextStyle,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              context.read<GoalResourcesProvider>().removeResource(
                context.read<GoalResourcesProvider>().goalResources[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
