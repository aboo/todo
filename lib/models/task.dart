import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool isDone = false;
  @HiveField(3)
  Task({
    @required this.description,
    @required this.isDone,
    @required this.name,
  });
}
