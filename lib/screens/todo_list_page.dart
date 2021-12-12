import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/todo_list/action_button.dart';
import 'package:todo/widgets/todo_list/todo_item.dart';
import 'package:get/get.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Todos (12test)"),
      ),
      body: Column(
        children: [
          renderActionRow(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return TodoItem(
                    todoModel: TodoModel(
                        detail: "111", title: "2222", isDone: true, tags: []));
              },
              itemCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Container renderActionRow() {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.black12,
      child: Row(
        children: [
          SizedBox(width: 16),
          ActionButton(
            title: Text(
              "newest",
              style: TextStyle(color: Colors.white),
            ),
            backGroundColor: Colors.blue,
            onTap: () {},
          ),
          SizedBox(width: 8),
          ActionButton(
            title: Text(
              "latest",
              style: TextStyle(color: Colors.white),
            ),
            backGroundColor: Colors.black,
            onTap: () {},
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
      ),
    );
  }
}
