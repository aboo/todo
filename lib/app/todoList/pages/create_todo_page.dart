import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:todo/app/db/todo_database.dart';
import 'package:todo/app/model/todo_model.dart';
import 'package:todo/app/todoList/cubit/todo_cubit.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({Key? key}) : super(key: key);

  @override
  _CreateTodoPageState createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate("createTodo")),
      ),
      body: Container(
        child: BlocProvider(
          create: (context) => TodoCubit(TodoDatabase()),
          child: _CreateTodoPageView(),
        ),
      ),
    );
  }
}

class _CreateTodoPageView extends StatelessWidget {
  const _CreateTodoPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final get = context.read<TodoCubit>();
    get.getTodoList();
    return BlocConsumer<TodoCubit,TodoState>(builder: (context, state) {
      if (state is TodoInitial) {
        return _buildInitialView();
      } else if (state is TodoLoading) {
        return _buildLoading();
      } else if (state is TodoListLoaded) {
        return _buildWidgetCreateTodoPage(state.todoModel, context);
      } else {
        return _buildInitialView();
      }
    }, listener: (context, state) {
      if (state is TodoError) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
    });
  }
}

Widget _buildInitialView() {
  return Center(
    child: _CreateTodoPageInitialView(),
  );
}

class _CreateTodoPageInitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

Widget _buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget _buildWidgetCreateTodoPage(
    List<TodoModel> todoModel, BuildContext context) {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _tagController = TextEditingController();

  return Container(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(hintText: translate("title")),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(hintText: translate("description")),
          ),
          TextFormField(
            controller: _tagController,
            decoration: InputDecoration(hintText: translate("tag")),
          ),
          OutlinedButton(
              child: Text(translate("save")),
              onPressed: () {
                TodoModel todoModel = TodoModel(
                    DateTime.now().millisecondsSinceEpoch.toString(),
                    _titleController.text.toString(),
                    _descriptionController.text.toString(),
                    _tagController.text.toString(),
                    0);
                final insert = context.read<TodoCubit>();
                insert.createTodo(todoModel);

                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/todoPage', (Route<dynamic> route) => false);
              })
        ],
      ),
    ),
  );
}
