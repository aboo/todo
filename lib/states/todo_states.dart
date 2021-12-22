import 'package:flutter/cupertino.dart';
import 'package:todo/models/todo_model.dart';

class TodoState extends ChangeNotifier {
  final List<TodoModel> _todos = [
    TodoModel(
        id: 1, title: "First todo", description: "first todo description"),
    TodoModel(
        id: 2, title: "Second todo", description: "second todo description"),
  ];

  List<TodoModel> get todos => _todos;

  add(TodoModel todo) {
    todo.id = todos.last.id! + 1;
    _todos.add(todo);
    notifyListeners();
  }

  void toggleDone(int? id) {
    var index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void remove(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
