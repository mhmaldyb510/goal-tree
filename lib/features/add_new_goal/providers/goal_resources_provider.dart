import 'package:flutter/material.dart';
import 'package:goal_tree/core/models/resource_model.dart';

class GoalResourcesProvider extends ChangeNotifier {
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
}
