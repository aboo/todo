import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String detail;

  @HiveField(2)
  final List<String> tags;

  @HiveField(3)
  final bool isDone;

  TodoModel(
      {this.title, this.detail, this.tags = const [], this.isDone = false});
}
