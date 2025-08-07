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
          infoKey: 'DeadLine',
          infoValue: goal.deadline != null
              ? DateFormat(
                  'MMMM, dd, yyyy',
                ).format(goal.deadline ?? DateTime.now())
              : 'No deadline',
        ),
        InfoModel(
          infoKey: 'Priority',
          infoValue: GoalPriorityEnum.values[goal.priority].name.capitalize(),
        ),
      ],
    );
  }
}
