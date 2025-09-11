import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:goal_tree/core/helpers/goals_storage_helper.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/node_model.dart';
import 'package:goal_tree/features/goal_details/helpers/goal_model_to_json.dart';
import 'package:goal_tree/main.dart';
import 'package:graphview/GraphView.dart';

class GoalTreeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  // Recursively find a node by id in the tree
  NodeModel? _findNodeById(int id, Iterable<NodeModel> nodes) {
    for (var node in nodes) {
      if (node.id == id) return node;
      final found = _findNodeById(id, node.children);
      if (found != null) return found;
    }
    return null;
  }

  GoalModel goal;

  List<int> doneNodes = [];
  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  Node? selectedNode;
  final GoalsStorageHelper _goalsStorageHelper = GoalsStorageHelper(
    objectBox.store,
  );

  // Map node id to display name
  final Map<int, String> nodeNames = {};

  GoalTreeProvider({required this.goal}) {
    // Initialize graph with root node to avoid empty graph errors
  }

  void createGraph() {
    if (goal.isDone) doneNodes.add(goal.id);
    graph.addNode(Node.Id(goal.id));
    nodeNames[goal.id] = goal.title;
    for (var node in goal.nodes) {
      createNodes(goal.id, node);
    }
    notifyListeners();
  }

  void createNodes(int parentId, NodeModel nodeModel) {
    graph.addNode(Node.Id(nodeModel.id));
    nodeNames[nodeModel.id] = nodeModel.name;
    if (nodeModel.isDone) doneNodes.add(nodeModel.id);
    graph.addEdge(Node.Id(parentId), Node.Id(nodeModel.id));
    for (var child in nodeModel.children) {
      createNodes(nodeModel.id, child);
    }
  }

  void clickNode(Node node) {
    if (selectedNode == node) {
      selectedNode = null;
    } else {
      selectedNode = node;
    }
    notifyListeners();
  }

  Future<void> createNewNode(Node parent, String name) async {
    final parentId = parent.key?.value;
    if (parentId == null) return;
    final newNode = NodeModel(name: name);
    await objectBox.store.box<NodeModel>().putAsync(newNode);

    if (parentId == goal.id) {
      goal.nodes.add(newNode);
    } else {
      NodeModel? parentNode = _findNodeById(parentId, goal.nodes);
      if (parentNode != null) {
        parentNode.children.add(newNode);
        await objectBox.store.box<NodeModel>().putAsync(parentNode);
      }
    }
    log(goalModelToJson(goal).replaceAll(',', '\n'));
    await _goalsStorageHelper.updateGoal(goal);
    goal = (await _goalsStorageHelper.getGoalById(goal.id)) ?? goal;
    clearTheGraph();
    createGraph();
  }

  void changeDoneState(Node node) async {
    final nodeId = node.key?.value as int?;
    if (nodeId == null) {
      // It's safest to do nothing if we don't have a valid ID.
      return;
    }

    if (nodeId == goal.id) {
      // This is the root goal.
      goal.isDone = !goal.isDone;
      await _goalsStorageHelper.updateGoal(goal);
    } else {
      // This is a child node.
      final nodeModel = await _goalsStorageHelper.getNodeById(nodeId);
      if (nodeModel != null) {
        nodeModel.isDone = !nodeModel.isDone;
        await _goalsStorageHelper.updateNode(nodeModel);
      } else {
        // Node not found in storage, cannot update. Log or handle error.
        return;
      }
    }

    // Reload the entire goal from storage to ensure UI is consistent with DB.
    final updatedGoal = await _goalsStorageHelper.getGoalById(goal.id);
    if (updatedGoal != null) {
      goal = updatedGoal;
      clearTheGraph();
      createGraph();
      notifyListeners();
    }
  }

  void clearTheGraph() {
    graph.edges.clear();
    graph.nodes.clear();
    doneNodes.clear();
  }
}
