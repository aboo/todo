import 'package:hive/hive.dart';
import 'package:todo_app_challenge/models/task.dart';

class HiveServices {
  var box = Hive.box("task");
  addTasks(Task task) async {
    await box.add(task);
  }

  List getTasks() {
    Map<dynamic, dynamic> taskList = box.toMap();
    return taskList.values.toList();
  }
}
