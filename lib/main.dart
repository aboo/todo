import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/states/todo_states.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
      initialRoute: '/',
      routes: {},
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildApp(context),
    );
  }

  _buildApp(BuildContext context) {
    // return Text("Implement Todo App here!");
    int counterTodoIsDone = 0;
    int counterTodo = 0;
    final todo = Provider.of<TodoState>(context);
    if (todo.todos.isNotEmpty) {
      counterTodoIsDone = 0;
      counterTodo = 0;
      for (int i = 0; i < todo.todos.length; i++) {
        if (todo.todos[i].isDone) {
          counterTodoIsDone++;
        }
        if (!todo.todos[i].isDone) {
          counterTodo++;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo list"),
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              direction: Axis.vertical,
              children: [
                Text('Todo Completed: $counterTodoIsDone'),
                Text('Todo Pending: $counterTodo'),
              ],
            ))
          ],
        ),
      ),
      body: const TodoList(),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoState>(
      builder: (context, todoState, child) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoState.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: todoState.todos[index].isDone,
                  onChanged: (bool? newValue) => {
                    todoState.toggleDone(todoState.todos[index].id),
                  },
                ),
                Text(todoState.todos[index].title.toString()),
                IconButton(
                  tooltip: "Edit",
                  icon: const Icon(Icons.edit),
                  onPressed: () => {},
                ),
                IconButton(
                  tooltip: "Details",
                  icon: const Icon(Icons.remove_red_eye_sharp),
                  onPressed: () => {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
