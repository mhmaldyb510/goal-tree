import 'package:objectbox/objectbox.dart';

@Entity()
class ResourceModel {
  @Id()
  int id = 0;

  String name;
  String link;

  ResourceModel({this.name = '', this.link = ''});
}
