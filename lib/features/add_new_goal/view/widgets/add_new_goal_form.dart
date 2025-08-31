import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/add_new_goal/model/validators.dart';
import 'package:provider/provider.dart';
import 'package:goal_tree/features/add_new_goal/providers/add_new_goal_provider.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_custom_text_form_field.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_resource_button.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/priority_list.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/resources_list.dart';
import 'package:goal_tree/features/home/view/widgets/add_resource_form.dart';
import 'package:goal_tree/features/home/view/widgets/cancel_adding_resource_button.dart';

class AddNewGoalForm extends StatelessWidget {
  const AddNewGoalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddNewGoalProvider>(context);
    return Consumer<AddNewGoalProvider>(
      builder: (context, goalResourcesProvider, child) {
        return Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddNewGoalCustomTextFormField(
                  controller: provider.goalTitle,
                  hintText: 'Goal Title',
                  validator: Validators.titleValidation,
                ),
                const SizedBox(height: 24),
                AddNewGoalCustomTextFormField(
                  controller: provider.goalDescription,
                  hintText: 'Goal Description',
                  maxLines: 5,
                ),
                const SizedBox(height: 24),
                Text('Deadline', style: AppTextStyles.headText).tr(),
                const SizedBox(height: 24),
                AddNewGoalCustomTextFormField(
                  controller: provider.goalDeadlineController,
                  hintText: 'Select Deadline',
                  suffixIcon: const Icon(Icons.calendar_month),
                  readOnly: true,
                  onTap: () => provider.pickTime(context),
                ),
                const SizedBox(height: 24),
                Text('Priority', style: AppTextStyles.headText).tr(),
                const SizedBox(height: 24),
                PriorityList(
                  onPriorityChanged: (value) => provider.changePriority(value),
                ),
                const SizedBox(height: 24),
                AddNewGoalCustomTextFormField(
                  controller: provider.goalNotes,
                  hintText: 'Notes',
                  maxLines: 5,
                ),
                const SizedBox(height: 24),
                Text('Resources', style: AppTextStyles.headText).tr(),
                const SizedBox(height: 24),
                const ResourcesList(),
                if (provider.addingResource) const AddResourceForm(),

                const SizedBox(height: 24),
                !provider.addingResource
                    ? AddResourceButton(
                        onPressed: () => provider.toggleAddingResource(),
                      )
                    : CancelAddingResourceButton(
                        onPressed: () => provider.toggleAddingResource(),
                      ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
