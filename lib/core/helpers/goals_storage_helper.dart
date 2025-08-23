import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/objectbox.g.dart';

class GoalsStorageHelper {
  final Box<GoalModel> _goalBox;

  GoalsStorageHelper(Store store) : _goalBox = store.box<GoalModel>();

  Future<int> addGoal(GoalModel goal) => _goalBox.putAsync(goal);

  Future<List<GoalModel>> getGoals() => _goalBox.getAllAsync();

  Future<int> updateGoal(GoalModel goal) => _goalBox.putAsync(goal);

  Future<void> removeGoal(GoalModel goal) async {
    await _goalBox.removeAsync(goal.id);
  }

  Future<GoalModel?> getGoalById(int id) => _goalBox.getAsync(id);
}
