import 'package:flutter/material.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_new_goal_custom_text_form_field.dart';
import 'package:goal_tree/features/add_new_goal/view/widgets/add_resource_button.dart';

class AddResourceForm extends StatefulWidget {
  const AddResourceForm({super.key});

  @override
  State<AddResourceForm> createState() => _AddResourceFormState();
}

class _AddResourceFormState extends State<AddResourceForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddNewGoalCustomTextFormField(hintText: 'Resource Name'),
          SizedBox(height: 24),
          AddNewGoalCustomTextFormField(hintText: 'Resource Link'),
          SizedBox(height: 24),
          AddResourceButton(onPressed: () {}),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
