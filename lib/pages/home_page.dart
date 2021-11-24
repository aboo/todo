import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/component/todo_card.dart';
import 'package:todo/pages/add_item_page.dart';
import 'package:todo/providers/todo_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TodoApp",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView(
        children: List.generate(
          todoProvider.filteredTodoList.length,
              (index) => TodoCard(
            todoProvider: todoProvider,
            todo: todoProvider.filteredTodoList[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddItemPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
