import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/goal_priority_enum.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/features/home/cubit/home_cubit.dart';
import 'package:intl/intl.dart';

class AddNewGoalProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController goalTitle = TextEditingController();
  final TextEditingController goalDescription = TextEditingController();
  final TextEditingController goalDeadlineController = TextEditingController();
  DateTime? goalDeadline;
  GoalPriorityEnum goalPriority = GoalPriorityEnum.medium;
  final TextEditingController goalNotes = TextEditingController();
  bool addingResource = false;
  bool isCreatingGoal = false;

  final List<ResourceModel> _goalResources = [];

  List<ResourceModel> get goalResources => List.unmodifiable(_goalResources);

  void addResource(ResourceModel resource) {
    _goalResources.add(resource);
    notifyListeners();
  }

  void removeResource(ResourceModel resource) {
    _goalResources.remove(resource);
    notifyListeners();
  }

  void clearResources() {
    _goalResources.clear();
    notifyListeners();
  }

  void toggleAddingResource() {
    addingResource = !addingResource;
    notifyListeners();
  }

  void pickTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      goalDeadline = pickedDate;
      goalDeadlineController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      notifyListeners();
    }
  }

  void changePriority(GoalPriorityEnum priority) {
    goalPriority = priority;
    notifyListeners();
  }

  void createGoal(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    isCreatingGoal = true;
    notifyListeners();

    try {
      await context.read<HomeCubit>().addGoal(
        GoalModel(
          title: goalTitle.text,
          description: goalDescription.text,
          deadline: goalDeadline,
          priority: goalPriority.index,
          notes: goalNotes.text,
          initialResources: goalResources,
        ),
      );
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add goal: ${e.toString()}')),
        );
      }
    } finally {
      if (context.mounted) {
      isCreatingGoal = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    goalTitle.dispose();
    goalDescription.dispose();
    goalDeadlineController.dispose();
    goalNotes.dispose();
    super.dispose();
  }
}
