import 'package:objectbox/objectbox.dart';

@Entity()
class NodeModel {
  @Id()
  int id = 0;

  String name;
  bool isDone;
  final children = ToMany<NodeModel>();
  final parent = ToOne<NodeModel>(); // optional back-ref

  NodeModel({this.name = '', this.isDone = false});
}
