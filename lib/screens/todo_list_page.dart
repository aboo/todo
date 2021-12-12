import 'package:flutter/material.dart';
import 'package:todo/config/app_routes.dart';
import 'package:todo/controllers/todo_list_controller.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/todo_list/action_button.dart';
import 'package:todo/widgets/todo_list/todo_item.dart';
import 'package:get/get.dart';

class TodoListPage extends StatelessWidget {
  TodoListController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      controller.getAllTodos();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("All Todos (12test)"),
      ),
      body: Obx(() => Container(
            child: controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      renderActionRow(),
                      Obx(() => controller.showNew.value
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (ctx, index) {
                                  return TodoItem(
                                      todoModel: controller.todoList[index]);
                                },
                                itemCount: controller.todoList.length,
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemBuilder: (ctx, index) {
                                  return TodoItem(
                                    todoModel: controller.todoList.reversed
                                        .toList()[index],
                                  );
                                },
                                itemCount: controller.todoList.length,
                              ),
                            ))
                    ],
                  ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(AppRoutes.newTodo);
        },
      ),
    );
  }

  Container renderActionRow() {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.black12,
      child: Obx(() => Row(
            children: [
              SizedBox(width: 16),
              ActionButton(
                title: Text(
                  "newest",
                  style: TextStyle(color: Colors.white),
                ),
                backGroundColor:
                    controller.showNew.value ? Colors.blue : Colors.black,
                onTap: () {
                  controller.showNew.value = true;
                },
              ),
              SizedBox(width: 8),
              ActionButton(
                title: Text(
                  "latest",
                  style: TextStyle(color: Colors.white),
                ),
                backGroundColor:
                    !controller.showNew.value ? Colors.blue : Colors.black,
                onTap: () {
                  controller.showNew.value = false;
                },
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(hintText: "filter by tags"),
                onSubmitted: (value) {},
              ))
            ],
          )),
    );
  }
}
