import 'package:objectbox/objectbox.dart';

@Entity()
class NodeModel {
  @Id(assignable: true)
  int id = DateTime.now().millisecondsSinceEpoch;

  String name;
  bool isDone;
  final children = ToMany<NodeModel>();
  final parent = ToOne<NodeModel>(); // optional back-ref

  NodeModel({this.name = '', this.isDone = false});
}
