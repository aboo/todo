import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app_challenge/hive_services.dart';
import 'package:todo_app_challenge/models/task.dart';

class EditTaskViewModel extends BaseViewModel {
  HiveServices hiveServices;
  EditTaskViewModel({@required this.hiveServices});
  String _description;
  String _name;
  bool _isDone;

  editTask(Task task) async {
    task.name = (name == null) ? task.name : name;
    task.description = (description == null) ? task.description : description;

    await hiveServices.updateTask(task);
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
