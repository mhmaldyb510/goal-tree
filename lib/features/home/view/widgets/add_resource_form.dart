import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/features/add_new_goal/model/validators.dart';
import 'package:goal_tree/features/add_new_goal/providers/goal_resources_provider.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_custom_text_form_field.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_resource_button.dart';
import 'package:provider/provider.dart';

class AddResourceForm extends StatefulWidget {
  const AddResourceForm({super.key});

  @override
  State<AddResourceForm> createState() => _AddResourceFormState();
}

class _AddResourceFormState extends State<AddResourceForm> {
  final _formKey = GlobalKey<FormState>();
  String? _resourceName;
  String? _resourceLink;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddNewGoalCustomTextFormField(
            hintText: 'Resource Name',
            validator: Validators.resourceNameValidation,
            onChanged: (value) => _resourceName = value,
          ),
          SizedBox(height: 24),
          AddNewGoalCustomTextFormField(
            hintText: 'Resource Link',
            onChanged: (value) => _resourceLink = value,
          ),
          SizedBox(height: 24),
          AddResourceButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                context.read<GoalResourcesProvider>().addResource(
                  ResourceModel(
                    name: _resourceName ?? '',
                    link: _resourceLink ?? '',
                  ),
                );
              }
            },
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
