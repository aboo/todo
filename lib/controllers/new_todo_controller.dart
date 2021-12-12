import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/todo_service.dart';

class NewTodoControler extends GetxController {
  var loading = false.obs;
  var tags = RxList<String>();
  var markedAsDone = false.obs;

  addTag(String tag) {
    tags.add(tag);
  }

  save(String title, String detail) async {
    loading.value = true;
    await TodoService().addTodo(TodoModel(
        title: title,
        detail: detail,
        tags: tags.value,
        isDone: markedAsDone.value));
    await Future.delayed(Duration(microseconds: 500));
    loading.value = false;
  }
}
