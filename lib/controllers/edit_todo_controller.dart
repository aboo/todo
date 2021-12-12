import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/todo_service.dart';

class EditTodoController extends GetxController {
  TodoModel model;
  var title = "".obs;
  var detial = "".obs;
  var markedAsDone = false.obs;
  var loading = false.obs;
  var tags = RxList<String>();

  init(TodoModel model) {
    this.model = model;
    title.value = model.title;
    detial.value = model.detail;
    markedAsDone.value = model.isDone;
  }

  save(String title, String detail) {
    model.title = title;
    model.detail = detail;
    model.isDone = markedAsDone.value;
    model.tags = tags.value;
    TodoService().edit(model);
    Get.back();
  }

  addTag(String tag) {
    tags.add(tag);
  }
}
