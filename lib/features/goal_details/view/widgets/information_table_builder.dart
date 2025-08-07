import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/helpers/capitalize_string.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/goal_priority_enum.dart';
import 'package:goal_tree/features/goal_details/model/info_model.dart';
import 'package:goal_tree/features/goal_details/view/widgets/info_table.dart';

class InformationTableBuilder extends StatelessWidget {
  const InformationTableBuilder({super.key, required this.goal});

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    return InfoTable(
      information: [
        InfoModel(
          infoKey: 'DeadLine'.tr(),
          infoValue: goal.deadline != null
              ? DateFormat(
                  'MMMM, dd, yyyy',
                  context.locale.toString(),
                ).format(goal.deadline!)
              : 'No deadline'.tr(),
        ),
        InfoModel(
          infoKey: 'Priority'.tr(),
          infoValue:
              (goal.priority >= 0 &&
                  goal.priority < GoalPriorityEnum.values.length)
              ? GoalPriorityEnum.values[goal.priority].name.capitalize()
              : 'Unknown'.tr(),
        ),
      ],
    );
  }
}
