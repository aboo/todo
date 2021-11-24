import 'package:flutter/material.dart';
import 'package:todo/data_models/todo.dart';
import 'package:todo/sql_service/sql_services.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList;
  List<Todo> filteredTodoList = [];

  TodoProvider(this.todoList) {
    filteredTodoList = todoList;
  }

  void addItem(Todo todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void deleteItem(int id) {
    SqLiteService.delete(id);
    filteredTodoList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateCheckTask(bool check, int id) {
    SqLiteService.updateCheck(check, id);
    filteredTodoList.firstWhere((element) => element.id == id).isComplete =
    check ? 1 : 0;
    notifyListeners();
  }

}
