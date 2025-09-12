import 'package:goal_tree/core/models/node_model.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GoalModel {
  @Id()
  int id = 0;

  String goalId;
  String title;
  String description;
  double progress;
  @Property(type: PropertyType.date)
  DateTime? deadline;
  String notes;
  // Use integer for enum storage or converter later
  int priority;

  final resources = ToMany<ResourceModel>();
  final nodes = ToMany<NodeModel>();
  bool isDone;

  GoalModel({
    this.goalId = '',
    this.title = '',
    this.description = '',
    this.progress = 0.0,
    this.deadline,
    this.notes = '',
    this.priority = 0,
    List<ResourceModel>? initialResources,
    List<NodeModel>? initialNodes,
    this.isDone = false,
  }) {
    if (initialResources != null) {
      resources.addAll(initialResources);
    }
    if (initialNodes != null) {
      nodes.addAll(initialNodes);
    }
  }
}
