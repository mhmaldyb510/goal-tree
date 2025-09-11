import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:goal_tree/core/helpers/goals_storage_helper.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/node_model.dart';
import 'package:goal_tree/main.dart';
import 'package:graphview/GraphView.dart';

class GoalTreeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  GoalTreeState state = GoalTreeState.initial;

  GoalModel goal;

  List<int> doneNodes = [];
  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  Node? selectedNode;
  final GoalsStorageHelper _goalsStorageHelper = GoalsStorageHelper(
    objectBox.store,
  );

  final Map<int, String> nodeNames = {};

  GoalTreeProvider({required this.goal});

  void createGraph() {
    if (state == GoalTreeState.built) return;
    state = GoalTreeState.building;
    notifyListeners();
    if (goal.isDone) doneNodes.add(goal.id);
    if (state == GoalTreeState.built) return;
    state = GoalTreeState.building;
    notifyListeners();
    if (goal.isDone) doneNodes.add(goal.id);
    graph.addNode(Node.Id(goal.id));
    nodeNames[goal.id] = goal.title;
    for (var node in goal.nodes) {
      createNodes(goal.id, node);
    }
    state = GoalTreeState.built;
    state = GoalTreeState.built;
    notifyListeners();
  }

  void createNodes(int parentId, NodeModel nodeModel) {
    graph.addNode(Node.Id(nodeModel.id));
    nodeNames[nodeModel.id] = nodeModel.name;
    if (nodeModel.isDone) doneNodes.add(nodeModel.id);
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
    state = GoalTreeState.building;
    notifyListeners();
    final parentId = parent.key?.value;
    if (parentId == null) {
      state = GoalTreeState.built;
      notifyListeners();
      return;
    }
    final newNode = NodeModel(name: name);
    createNodes(parentId, newNode);
    notifyListeners();
    try {
      await _goalsStorageHelper.addNode(newNode);
      if (parentId == goal.id) {
        goal.nodes.add(newNode);
        await _goalsStorageHelper.updateGoal(goal);
      } else {
        final parentNode = await _goalsStorageHelper.getNodeById(parentId);
        if (parentNode != null) {
          parentNode.children.add(newNode);
          await _goalsStorageHelper.addNode(parentNode);
        }
      }
      final updatedGoal = await _goalsStorageHelper.getGoalById(goal.id);
      if (updatedGoal != null) {
        goal = updatedGoal;
      }
    } catch (e) {
      // Revert UI on error
      graph.removeNode(Node.Id(newNode.id));
      nodeNames.remove(newNode.id);
      goal.nodes.remove(newNode);
      if (kDebugMode) {
        log('Error adding node: $e');
      }
    } finally {
      state = GoalTreeState.built;
      notifyListeners();
    }
  }

  void changeDoneState(Node node) async {
    state = GoalTreeState.building;
    notifyListeners();

    final nodeId = node.key?.value as int?;
    if (nodeId == null) {
      state = GoalTreeState.built;
      notifyListeners();
      return;
    }

    final wasDone = doneNodes.contains(nodeId);
    if (wasDone) {
      doneNodes.remove(nodeId);
    } else {
      doneNodes.add(nodeId);
    }
    notifyListeners();

    try {
      if (nodeId == goal.id) {
        goal.isDone = !wasDone;
        await _goalsStorageHelper.updateGoal(goal);
      } else {
        final nodeModel = await _goalsStorageHelper.getNodeById(nodeId);
        if (nodeModel == null) throw Exception('Node not found');
        nodeModel.isDone = !wasDone;
        await _goalsStorageHelper.addNode(nodeModel);
      }

      final updatedGoal = await _goalsStorageHelper.getGoalById(goal.id);
      if (updatedGoal == null) throw Exception('Goal not found after update');
      goal = updatedGoal;
    } catch (e) {
      // Revert UI on error
      if (wasDone) {
        doneNodes.add(nodeId);
      } else {
        doneNodes.remove(nodeId);
      }
      if (nodeId == goal.id) {
        goal.isDone = wasDone;
      }
      // if in debug mode
      if (kDebugMode) {
        log(e.toString());
      }
    } finally {
      state = GoalTreeState.built;
      notifyListeners();
    }
  }
}

enum GoalTreeState { initial, building, built }
