import 'package:bloc/bloc.dart';
import 'package:goal_tree/core/models/goal_model.dart';
import 'package:goal_tree/main.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final box = objectBox.store.box<GoalModel>();
  Future<void> getAllGoals() async {
    emit(HomeLoading());
    List<GoalModel> goals = await box.getAllAsync();
    emit(HomeLoaded(goals: goals));
  }
}
