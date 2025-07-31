import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/objectbox.g.dart';

class GoalsStorageHelper {
  final Box<GoalModel> _goalBox;

  GoalsStorageHelper(Store store) : _goalBox = store.box<GoalModel>();

  Future<void> addGoal(GoalModel goal) async {
    await _goalBox.putAsync(goal);
  }

  Future<List<GoalModel>> getGoals() async {
    var goals = await _goalBox.getAllAsync();
    return goals;
  }

  Future<void> updateGoal(GoalModel goal) async {
    await _goalBox.putAsync(goal);
  }

  Future<void> removeGoal(GoalModel goal) async {
    await _goalBox.removeAsync(goal.id);
  }
}
