import 'package:flutter/cupertino.dart';

import 'Task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String taskTitle) {
    final task = Task(name: taskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  Task findById(String name){
    return tasks.firstWhere((task) => task.name == name );
  }
}
