import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_item_controller.dart';
import 'package:todo/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todoModel;

  TodoItem({Key key, this.todoModel}) : super(key: key);
  TodoItemController controller;
  @override
  Widget build(BuildContext context) {
    controller = TodoItemController(todoModel);
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(todoModel.title),
        subtitle: Text(todoModel.detail),
        trailing: Container(
          // width: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [_renderCheck(), SizedBox(width: 8), _renderDelete()],
          ),
        ),
      ),
    );
  }

  Widget _renderDelete() => IconButton(
      onPressed: () async {
        print("000");
        await controller.delete();
      },
      icon: Icon(Icons.delete));
  Widget _renderCheck() => Obx(() => IconButton(
      onPressed: () async {
        print("000");
        await controller.toggleCheck();
      },
      icon: Icon(controller.isDone.value ? Icons.check : Icons.remove)));
}
