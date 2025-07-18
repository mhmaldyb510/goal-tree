import 'package:goal_tree/core/models/goal_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late final Isar isar;

Future<void> openIsarDatabase() async {
  final dir = await getApplicationDocumentsDirectory();

  isar = await Isar.open([GoalModelSchema], directory: dir.path);
}
