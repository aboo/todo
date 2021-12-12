import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String detail;

  @HiveField(2)
  List<String> tags;

  @HiveField(3)
  bool isDone;

  TodoModel(
      {this.title, this.detail, this.tags = const [], this.isDone = false});
}
