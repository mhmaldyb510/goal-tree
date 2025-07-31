import 'package:bloc/bloc.dart';
import 'package:goal_tree/core/helpers/goals_storage_helper.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GoalsStorageHelper _goalsStorageHelper;
  HomeCubit(this._goalsStorageHelper) : super(HomeInitial());

  List<GoalModel> _goals = [];

  Future<void> getGoals() async {
    emit(HomeLoading());
    _goals = await _goalsStorageHelper.getGoals();
    emit(HomeLoaded(
      goals: _goals,
    ));
  }

  Future<void> addGoal(GoalModel goal) async {
    await _goalsStorageHelper.addGoal(goal);
    _goals = await _goalsStorageHelper.getGoals();
    emit(HomeLoaded(
      goals: _goals,
    ));
  }
}
