import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/todo_service.dart';

class TodoListController extends GetxController {
  var loading = true.obs;
  var todoList = RxList<TodoModel>();
  var showNew = false.obs;
  getAllTodos() async {
    loading.value = true;
    try {
      todoList.value = TodoService().getAll();
      await Future.delayed(Duration(microseconds: 500));
    } catch (e) {
      print(e);
    }
    loading.value = false;
  }
}
