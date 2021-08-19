import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:todo/app/db/todo_database.dart';
import 'package:todo/app/model/todo_model.dart';
import 'package:todo/app/todoList/cubit/todo_cubit.dart';

class UpdateTodoPage extends StatefulWidget {
  final TodoModel todoModel;

  const UpdateTodoPage({Key? key,required this.todoModel}) : super(key: key);

  @override
  _UpdateTodoPageState createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate("updateTodo")),
      ),
      body: Container(
        child: BlocProvider(
          create: (context) => TodoCubit(TodoDatabase()),
          child: _UpdateTodoPageView(widget.todoModel),
        ),
      ),
    );  }
}
class _UpdateTodoPageView extends StatelessWidget {
  final TodoModel todoModel;

  const _UpdateTodoPageView(this.todoModel);

  @override
  Widget build(BuildContext context) {
    final get = context.read<TodoCubit>();
    get.getTodo(todoModel);
    return BlocConsumer<TodoCubit, TodoState>
      (builder: (context, state) {
      if (state is TodoInitial) {
        return _buildInitialView();
      } else if (state is TodoLoading) {
        return _buildLoading();
      } else if (state is TodoLoaded) {
        return _buildWidgetUpdateTodoPage(state.todoModel, context);
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
    child: _UpdateTodoPageInitialView(),
  );
}

class _UpdateTodoPageInitialView extends StatelessWidget {
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

Widget _buildWidgetUpdateTodoPage(TodoModel todoModel, BuildContext context) {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _tagController = TextEditingController();

  return Container(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController..text = todoModel.title,
            decoration: InputDecoration(hintText: translate("title")),
          ),
          TextFormField(
            controller: _descriptionController..text = todoModel.description,
            decoration: InputDecoration(hintText: translate("description")),
          ),
          TextFormField(
            controller: _tagController..text = todoModel.tag,
            decoration: InputDecoration(hintText: translate("tag")),
          ),
          OutlinedButton(
              child: Text(translate("save")),
              onPressed: () {
                TodoModel _todoModel = TodoModel(
                    todoModel.id,
                    _titleController.text.toString(),
                    _descriptionController.text.toString(),
                    _tagController.text.toString(),
                    todoModel.isComplete);

                final update = context.read<TodoCubit>();
                update.updateTodo(_todoModel);

                Navigator.of(context).pushNamed(
                    '/todoPage');
              })
        ],
      ),
    ),
  );
}
