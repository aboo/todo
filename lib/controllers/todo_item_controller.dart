import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo/controllers/todo_list_controller.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/todo_service.dart';

class TodoItemController extends GetxController {
  final TodoModel todoModel;
  TodoService todoService = TodoService();
  var isDone = false.obs;
  TodoItemController(this.todoModel) {
    isDone.value = todoModel.isDone;
  }
  toggleCheck() async {
    isDone.value = !isDone.value;
    todoModel.isDone = todoModel.isDone;
    await todoModel.save();
    update();
  }

  delete() async {
    print("object");
    await todoModel.delete();
    Get.find<TodoListController>().getAllTodos();
  }
}
