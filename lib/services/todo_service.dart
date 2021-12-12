import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/config/config_strings.dart';
import 'package:todo/models/todo_model.dart';

class TodoService {
  Future addTodo(TodoModel model) {
    return Hive.box<TodoModel>(ConfigStrings.TODO_BOX).add(model);
  }

  Future delete(TodoModel model) {
    return model.delete();
  }

  Future edit(TodoModel model) {
    return model.save();
  }

  List<TodoModel> getAll() {
    return Hive.box<TodoModel>(ConfigStrings.TODO_BOX).values.toList();
  }
}
