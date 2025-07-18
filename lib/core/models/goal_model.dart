import 'package:isar/isar.dart';

part 'goal_model.g.dart';

@collection
class GoalModel {
  Id id = Isar.autoIncrement;
  final String goalId;
  final String title;
  final String description;
  final double progress;
  final DateTime? deadline;
  final String notes;
  final List<ResourceModel> resources;
  @enumerated
  final GoalPriorityEnum priority;
  final List<NodeModel> nodes;
  GoalModel({
    this.goalId = '',
    this.nodes = const [],
    this.resources = const [],
    this.title = '',
    this.description = '',
    this.progress = 0.0,
    this.deadline,
    this.notes = '',
    this.priority = GoalPriorityEnum.low,
  });
}

@embedded
class NodeModel {
  String id;
  String name;
  bool isDone;
  List<NodeModel> children;

  NodeModel({
    this.id = '',
    this.name = '',
    this.isDone = false,
    this.children = const [],
  });
}

@embedded
class ResourceModel {
  String name;
  String link;

  ResourceModel({this.name = '', this.link = ''});
}

enum GoalPriorityEnum { low, medium, high }
