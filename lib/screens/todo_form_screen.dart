import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/states/todo_model_state.dart';

class ScreenArguments {
  final int? todoId;

  ScreenArguments(this.todoId);
}

class TodoEntryScreen extends StatelessWidget {
  const TodoEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create todo"),
      ),
      body: TodoFormScreen(),
    );
  }
}

class TodoFormScreen extends StatefulWidget {
  @override
  TodoFormScreenState createState() {
    return TodoFormScreenState();
  }
}

class TodoFormScreenState extends State<TodoFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEditForm = false;
  dynamic editableTodo;

  final TodoModelState? todoModel;

  TodoFormScreenState({this.todoModel});

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createTodo(Function addTodo) {
    var todo = TodoModel(
        title: titleController.text, description: descriptionController.text);
    addTodo(todo);
    Navigator.pop(context);
  }

  void editTodo(Function editTodo) {
    editTodo(editableTodo.id, titleController.text, descriptionController.text);
    Navigator.pop(context);
  }

  void deleteTodo(Function deleteTodo) {
    deleteTodo(editableTodo.id);
    Navigator.pop(context);
  }

  void loadTodoForEdit(BuildContext context, TodoModelState todo) {
    final ScreenArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments?;
    if (arguments != null && arguments.todoId != null) {
      isEditForm = true;

      editableTodo = todo.read(arguments.todoId!);
      titleController.text = editableTodo.title;
      descriptionController.text = editableTodo.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoModelState>(context);
    loadTodoForEdit(context, todo);
    return Form(
      key: _formKey,
      child: Consumer<TodoModelState>(
        builder: (context, todoModel, child) => Column(
          children: <Widget>[
            TextFormField(
              maxLength: 20,
              controller: titleController,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                  errorStyle: TextStyle(), labelText: 'Todo text'),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
            ),
            TextFormField(
              maxLength: 50,
              controller: descriptionController,
              decoration: const InputDecoration(
                  errorStyle: TextStyle(), labelText: 'Description text'),
            ),
            ElevatedButton(
              child: Text(isEditForm ? "Update" : "Save"),
              onPressed: () => {
                isEditForm
                    ? _formKey.currentState!.validate()
                        ? editTodo(todoModel.update)
                        : null
                    : _formKey.currentState!.validate()
                        ? createTodo(todoModel.add)
                        : null
              },
            ),
            isEditForm
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                      child: const Text("Delete"),
                      onPressed: () => deleteTodo(todoModel.delete),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
