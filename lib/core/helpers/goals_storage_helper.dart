import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/core/models/node_model.dart';
import 'package:goal_tree/objectbox.g.dart';

class GoalsStorageHelper {
  final Box<GoalModel> _goalBox;
  final Box<NodeModel> _nodeBox;

  GoalsStorageHelper(Store store)
      : _goalBox = store.box<GoalModel>(),
        _nodeBox = store.box<NodeModel>();

  Future<int> addGoal(GoalModel goal) => _goalBox.putAsync(goal);

  Future<List<GoalModel>> getGoals() => _goalBox.getAllAsync();

  Future<int> updateGoal(GoalModel goal) => _goalBox.putAsync(goal);

  Future<void> removeGoal(GoalModel goal) async {
    await _goalBox.removeAsync(goal.id);
  }

  Future<GoalModel?> getGoalById(int id) => _goalBox.getAsync(id);

  Future<NodeModel?> getNodeById(int nodeId) => _nodeBox.getAsync(nodeId); 

  Future<int> addNode(NodeModel node) => _nodeBox.putAsync(node);
  
}
