import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/todo_form_screen.dart';
import 'package:todo/states/todo_model_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModelState(),
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
      routes: {
        '/entry': (context) => const TodoEntryScreen(),
      },
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
    final todo = Provider.of<TodoModelState>(context);
    if (todo.todoList.isNotEmpty) {
      counterTodoIsDone = 0;
      counterTodo = 0;
      for (int i = 0; i < todo.todoList.length; i++) {
        if (todo.todoList[i].isDone) {
          counterTodoIsDone++;
        }
        if (!todo.todoList[i].isDone) {
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {Navigator.pushNamed(context, "/entry")},
      ),
    );
  }
}

showAlertDialog(BuildContext context, int todoId, TodoModelState todoStates) {
  var lookAtTodo = todoStates.read(todoId);
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(lookAtTodo.title.toString()),
    content: Text(lookAtTodo.description.toString()),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoModelState>(context);
    return Consumer<TodoModelState>(
      builder: (context, todoState, child) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoState.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: todoState.todoList[index].isDone,
                  onChanged: (bool? newValue) => {
                    todoState.toggleDone(todoState.todoList[index].id),
                  },
                ),
                Text(todoState.todoList[index].title.toString()),
                IconButton(
                  tooltip: "Edit",
                  icon: const Icon(Icons.edit),
                  onPressed: () => {
                    Navigator.pushNamed(context, "/entry",
                        arguments:
                            ScreenArguments(todoState.todoList[index].id))
                  },
                ),
                IconButton(
                  tooltip: "Details",
                  icon: const Icon(Icons.remove_red_eye_sharp),
                  onPressed: () => {
                    showAlertDialog(
                        context,
                        int.parse(todoState.todoList[index].id.toString()),
                        todo)
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
