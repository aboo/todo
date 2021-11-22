import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app_challenge/models/task.dart';

import '../hive_services.dart';

class AddTaskViewModel extends BaseViewModel {
  String _description = "";
  String _name = "";
  bool _isDone = false;

  HiveServices hiveServices;
  AddTaskViewModel({@required this.hiveServices});

  addTask() async {
    Task task = Task(
      description: description,
      isDone: false,
      name: name,
    );
    await hiveServices.addTasks(task);
  }

  String get description => _description;
  setdescription(String description) {
    _description = description;
    notifyListeners();
  }

  String get name => _name;
  setname(String name) {
    _name = name;
    notifyListeners();
  }

  bool get isDone => _isDone;
  setisDonel(bool isDone) {
    _isDone = isDone;
    notifyListeners();
  }
}
