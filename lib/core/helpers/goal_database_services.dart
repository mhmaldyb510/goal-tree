import 'package:goal_tree/core/helpers/open_the_database.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:isar/isar.dart'; // or wherever your global `isar` is defined

class GoalDatabaseService {
  /// Add a new goal
  Future<void> addGoal(GoalModel goal) async {
    await isar.writeTxn(() async {
      await isar.goalModels.put(goal);
    });
  }

  /// Delete a goal by its ID
  Future<void> deleteGoalById(Id id) async {
    await isar.writeTxn(() async {
      await isar.goalModels.delete(id);
    });
  }

  /// Get all goals
  Future<List<GoalModel>> getAllGoals() async {
    return await isar.goalModels.where().findAll();
  }

  /// Clear all goals
  Future<void> clearAllGoals() async {
    await isar.writeTxn(() async {
      await isar.goalModels.clear();
    });
  }

  /// Get goal by ID
  Future<GoalModel?> getGoalById(Id id) async {
    return await isar.goalModels.get(id);
  }
}
