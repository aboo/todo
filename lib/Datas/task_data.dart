import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';

class TaskData extends ChangeNotifier{

  List<TaskItem> tasks = [];

  void selectStop(TaskData stopItem){

  }

  void clearList()
  {
    tasks.clear();
  }


  void addTask({ int itemIndex, String name,String date})
  {
    final task=TaskItem(itemIndex: itemIndex, name: name, date: date);
    tasks.add(task);
    // notifyListeners();
  }

}