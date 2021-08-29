import 'package:flutter/material.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';
import 'package:todo/presentation/screens/home/widgets/todo_item.dart';

class TodoListWidget extends StatelessWidget {
  final List<ToDoEntity> data;

  const TodoListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => ToDoItem(entity: data[index]),
      itemCount: data.length,
    );
  }
}
