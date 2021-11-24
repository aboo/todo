import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/component/todo_card.dart';
import 'package:todo/data_models/todo.dart';
import 'package:todo/pages/add_item_page.dart';
import 'package:todo/pages/filter_page.dart';
import 'package:todo/providers/todo_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of(context);
    int pendingTodo = todoProvider.todoList
        .where((element) => element.isComplete == 0)
        .toList()
        .length;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "pending task: $pendingTodo",
                style: const TextStyle(color: Colors.white),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    todoProvider.updateFirstInsertSort();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        todoProvider.firstInsertSort
                            ? "first inserted"
                            : "last inserted",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.swap_vert_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => ChangeNotifierProvider.value(
                        value: todoProvider,
                        child: const FilterPage(),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
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
          dynamic todo = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddItemPage()));
          if (todo is Todo) {
            todoProvider.addItem(todo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
