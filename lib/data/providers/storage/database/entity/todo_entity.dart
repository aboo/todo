import 'package:floor/floor.dart';

abstract class ToDoStatus {
  static const int todo = 0;
  static const int inProgress = 1;
  static const int done = 2;

  static List<String> getList() {
    return const ['todo', 'inProgress', 'done'];
  }
}

@entity
class ToDoEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final int userId;
  final String title;
  final int orderIndex;
  final String description;
  final String dateTime;
  final int status;
  final String tagId;

  ToDoEntity(
      {this.id,
      this.orderIndex = -1,
      this.userId = -1,
      this.status = ToDoStatus.todo,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.tagId});
}
