import 'package:flutter/cupertino.dart';
import 'package:todo/models/todo_model.dart';

class TodoModelState extends ChangeNotifier {
  final List<TodoModel> _todoList = [
    TodoModel(
      id: 1,
      title: "todo number1",
      description: "1 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 2,
      title: "todo number2",
      description: "2 todo description",
    ),
    TodoModel(
      id: 3,
      title: "todo number3",
      description: "3 todo description",
    ),
    TodoModel(
      id: 4,
      title: "todo number4",
      description: "4 todo description",
    ),
    TodoModel(
      id: 5,
      title: "todo number5",
      description: "5 todo description",
    ),
    TodoModel(
      id: 6,
      title: "todo number6",
      description: "6 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 7,
      title: "todo number7",
      description: "7 todo description",
    ),
    TodoModel(
      id: 8,
      title: "todo number8",
      description: "8 todo description",
    ),
    TodoModel(
      id: 9,
      title: "todo number9",
      description: "9 todo description",
    ),
    TodoModel(
      id: 10,
      title: "todo number10",
      description: "10 todo description",
    ),
    TodoModel(
      id: 11,
      title: "todo number11",
      description: "11 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 12,
      title: "todo number12",
      description: "12 todo description",
    ),
    TodoModel(
      id: 13,
      title: "todo number13",
      description: "13 todo description",
    ),
    TodoModel(
      id: 14,
      title: "todo number14",
      description: "14 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 15,
      title: "todo number15",
      description: "15 todo description",
    ),
    TodoModel(
      id: 16,
      title: "todo number16",
      description: "16 todo description",
    ),
    TodoModel(
      id: 17,
      title: "todo number17",
      description: "17 todo description",
    ),
    TodoModel(
      id: 18,
      title: "todo number18",
      description: "18 todo description",
    ),
    TodoModel(
      id: 19,
      title: "todo number19",
      description: "19 todo description",
    ),
    TodoModel(
      id: 20,
      title: "todo number20",
      description: "20 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 21,
      title: "todo number21",
      description: "21 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 22,
      title: "todo number22",
      description: "22 todo description",
      isDone: true,
    ),
    TodoModel(
      id: 23,
      title: "todo number23",
      description: "23 todo description",
    ),
    TodoModel(
      id: 24,
      title: "todo number24",
      description: "24 todo description",
    ),
    TodoModel(
      id: 25,
      title: "todo number25",
      description: "25 todo description",
      isDone: true,
    ),
  ];

  List<TodoModel> get todoList => _todoList;

  add(TodoModel todo) {
    todo.id = todoList.last.id! + 1;
    _todoList.add(todo);
    notifyListeners();
  }

  void update(int id, String newTitle, String newDescription) {
    var todo = _todoList.firstWhere((element) => element.id == id);
    todo.title = newTitle;
    todo.description = newDescription;
    notifyListeners();
  }

  void delete(int id) {
    _todoList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  TodoModel read(int id) {
    return todoList.firstWhere((element) => element.id == id);
  }

  void toggleDone(int? id) {
    var index = _todoList.indexWhere((element) => element.id == id);
    _todoList[index].isDone = !_todoList[index].isDone;
    notifyListeners();
  }

  void remove(int id) {
    _todoList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
