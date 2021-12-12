import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todoModel;

  const TodoItem({Key key, this.todoModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

  Widget _renderDelete() =>
      IconButton(onPressed: () {}, icon: Icon(Icons.delete));
  Widget _renderCheck() => IconButton(
      onPressed: () {},
      icon: Icon(todoModel.isDone ? Icons.check : Icons.remove));
}
