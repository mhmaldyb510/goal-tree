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

  List<Node> doneNodes = [];
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

  void addToDone(Node node) {
    doneNodes.add(node);
    notifyListeners();
  }

  void clearTheGraph() {
    graph.edges.clear();
    graph.nodes.clear();
    doneNodes.clear();
  }
}
