import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_custom_text_form_field.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_resource_button.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/priority_list.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/resources_list.dart';
import 'package:goal_tree/features/home/view/widgets/add_resource_form.dart';
import 'package:goal_tree/features/home/view/widgets/cancel_adding_resource_button.dart';

class AddNewGoalForm extends StatefulWidget {
  const AddNewGoalForm({super.key});

  @override
  State<AddNewGoalForm> createState() => _AddNewGoalFormState();
}

class _AddNewGoalFormState extends State<AddNewGoalForm> {
  final _formKey = GlobalKey<FormState>();
  String goalTitle = '';
  String goalDescription = '';
  TextEditingController goalDeadlineController = TextEditingController();
  GoalPriorityEnum? goalPriority;
  String? goalNotes;
  List<ResourceModel> goalResources = [];
  bool addingResource = false;

  @override
  void dispose() {
    goalDeadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddNewGoalCustomTextFormField(hintText: 'Goal Title'),
            SizedBox(height: 24),
            AddNewGoalCustomTextFormField(
              hintText: 'Goal Description',
              maxLines: 5,
            ),
            SizedBox(height: 24),
            Text('Deadline', style: AppTextStyles.headText).tr(),
            SizedBox(height: 24),
            AddNewGoalCustomTextFormField(
              controller: goalDeadlineController,
              hintText: 'Select Deadline',
              suffixIcon: Icon(Icons.calendar_month),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  goalDeadlineController.text = DateFormat(
                    'yyyy-MM-dd',
                  ).format(pickedDate);
                }
              },
            ),
            SizedBox(height: 24),
            Text('Priority', style: AppTextStyles.headText).tr(),
            SizedBox(height: 24),
            PriorityList(),
            SizedBox(height: 24),
            AddNewGoalCustomTextFormField(hintText: 'Notes', maxLines: 5),
            SizedBox(height: 24),
            Text('Resources', style: AppTextStyles.headText).tr(),
            SizedBox(height: 24),
            ResourcesList(),
            if (addingResource) AddResourceForm(),

            SizedBox(height: 24),
            !addingResource
                ? AddResourceButton(
                    onPressed: () {
                      setState(() {
                        addingResource = !addingResource;
                      });
                    },
                  )
                : CancelAddingResourceButton(
                    onPressed: () {
                      setState(() {
                        addingResource = !addingResource;
                      });
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
