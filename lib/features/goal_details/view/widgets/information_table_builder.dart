import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/helpers/capitalize_string.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/goal_priority_enum.dart';
import 'package:goal_tree/features/goal_details/model/info_model.dart';
import 'package:goal_tree/features/goal_details/view/widgets/info_table.dart';

class InformationTableBuilder extends StatefulWidget {
  const InformationTableBuilder({super.key, required this.goal});

  final GoalModel goal;

  @override
  State<InformationTableBuilder> createState() =>
      _InformationTableBuilderState();
}

class _InformationTableBuilderState extends State<InformationTableBuilder> {
  late DateFormat _dateFormat;
  late Locale _lastLocale;

  @override
  void initState() {
    super.initState();
    _updateDateFormat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentLocale = context.locale;
    if (_lastLocale != currentLocale) {
      _updateDateFormat();
    }
  }

  void _updateDateFormat() {
    _lastLocale = context.locale;
    _dateFormat = DateFormat('MMMM, dd, yyyy', _lastLocale.toString());
  }

  @override
  Widget build(BuildContext context) {
    return InfoTable(
      information: [
        InfoModel(
          infoKey: 'DeadLine'.tr(),
          infoValue: widget.goal.deadline != null
              ? _dateFormat.format(widget.goal.deadline!)
              : 'No deadline'.tr(),
        ),
        InfoModel(
          infoKey: 'Priority'.tr(),
          infoValue:
              (widget.goal.priority >= 0 &&
                  widget.goal.priority < GoalPriorityEnum.values.length)
              ? GoalPriorityEnum.values[widget.goal.priority].name.capitalize()
              : 'Unknown'.tr(),
        ),
      ],
    );
  }
}
