import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  List<String> tags;
  @HiveField(3)
  bool status;

  Task(this.title, this.description, this.tags, this.status);
}
