import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/goal_model.dart';

import 'package:goal_tree/core/models/goal_priority_enum.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/add_new_goal/model/validators.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';
import 'package:provider/provider.dart';
import 'package:goal_tree/features/add_new_goal/providers/goal_resources_provider.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_custom_text_form_field.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_resource_button.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/create_new_goal_button.dart';
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
  final TextEditingController goalTitle = TextEditingController();
  final TextEditingController goalDescription = TextEditingController();
  final TextEditingController goalDeadlineController = TextEditingController();
  DateTime? goalDeadline;
  GoalPriorityEnum goalPriority = GoalPriorityEnum.medium;
  final TextEditingController goalNotes = TextEditingController();
  bool addingResource = false;

  @override
  void dispose() {
    goalDeadlineController.dispose();
    goalTitle.dispose();
    goalDescription.dispose();
    goalNotes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoalResourcesProvider>(
      builder: (context, goalResourcesProvider, child) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddNewGoalCustomTextFormField(
                  controller: goalTitle,
                  hintText: 'Goal Title',
                  validator: Validators.titleValidation,
                ),
                SizedBox(height: 24),
                AddNewGoalCustomTextFormField(
                  controller: goalDescription,
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
                      goalDeadline = pickedDate;
                      goalDeadlineController.text = DateFormat(
                        'yyyy-MM-dd',
                      ).format(pickedDate);
                    }
                  },
                ),
                SizedBox(height: 24),
                Text('Priority', style: AppTextStyles.headText).tr(),
                SizedBox(height: 24),
                PriorityList(
                  onPriorityChanged: (value) {
                    goalPriority = value;
                  },
                ),
                SizedBox(height: 24),
                AddNewGoalCustomTextFormField(
                  controller: goalNotes,
                  hintText: 'Notes',
                  maxLines: 5,
                ),
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

                SizedBox(height: 24),
                CreateNewGoalButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await context.read<HomeCubit>().addGoal(
                        GoalModel(
                          title: goalTitle.text,
                          description: goalDescription.text,
                          deadline: goalDeadline,
                          priority: goalPriority.index,
                          notes: goalNotes.text,
                          initialResources: goalResourcesProvider.goalResources,
                        ),
                      );
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
