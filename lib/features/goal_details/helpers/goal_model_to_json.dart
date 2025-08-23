import 'dart:convert';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/node_model.dart';

String goalModelToJson(GoalModel goal) {
  Map<String, dynamic> goalMap = {
    'id': goal.id,
    'title': goal.title,
    'nodes': goal.nodes.map((node) => nodeToJson(node)).toList(),
    // Optionally add resources if needed
  };
  return jsonEncode(goalMap);
}

Map<String, dynamic> nodeToJson(NodeModel node) {
  return {
    'id': node.id,
    'name': node.name,
    'children': node.children.map((child) => nodeToJson(child)).toList(),
  };
}
