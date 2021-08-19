import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:todo/app/db/todo_database.dart';
import 'package:todo/app/model/todo_model.dart';
import 'package:todo/app/shared/colors.dart';
import 'package:todo/app/todoList/cubit/todo_cubit.dart';
import 'package:todo/app/todoList/pages/update_todo_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(translate("todolist"))),
      body: Container(
        child: BlocProvider<TodoCubit>(
          create: (_) => TodoCubit(TodoDatabase()),
          child: _TodoView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.of(context).pushNamed('/createTodo');
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = context.read<TodoCubit>();
    getData.getTodoList();
    var mediaQuery = MediaQuery.of(context);
    return BlocConsumer<TodoCubit, TodoState>(builder: (context, state) {
      if (state is TodoInitial) {
        return _buildInitialView();
      } else if (state is TodoLoading) {
        return _buildLoading();
      } else if (state is TodoListLoaded) {
        return _buildWidgetTodoList(state.todoModel,mediaQuery);
      } else {
        return _buildInitialView();
      }
    }, listener: (context, state) async {
      if (state is TodoError) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
    });
  }

  Widget _buildInitialView() {
    return Center(
      child: _TodoInitialView(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _TodoInitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

Widget _buildWidgetTodoList(List<TodoModel> todoModel,
    MediaQueryData mediaQuery) {
  return Container(
    width: mediaQuery.size.width,
    height: mediaQuery.size.height,
    child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context,index){
          final item = todoModel[index];
          if (index < todoModel.length) {
            return Dismissible(
              key: Key(item.title),
              onDismissed: (direction) {
                final delete = context.read<TodoCubit>();
                delete.deleteTodo(item.id);
                final getTodoList = context.read<TodoCubit>();
                getTodoList.getTodoList();
              },
              child: _todoCardWidget(todoModel, index, context, mediaQuery),
              background: Container(
                color: ColorApp.bgDismiss,
              ),
            );
          }
          return CircularProgressIndicator();
        },
      itemCount: todoModel.length,
    ),
  );
}

Widget _todoCardWidget(List<TodoModel> todoModel, int index,
    BuildContext context, MediaQueryData mediaQuery) {
  bool _isChecked = false;
  int isComplete;

  if (todoModel[index].isComplete == 0)
    _isChecked = false;
  else
    _isChecked = true;

  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          final item = todoModel[index];
          return UpdateTodoPage(
            todoModel: item,
          );
        }),
      );
    },
    child: Container(
        width: mediaQuery.size.width,
        color: ColorApp.white,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      _isChecked = !_isChecked;
                      if (_isChecked)
                        isComplete = 1;
                      else
                        isComplete = 0;
                      TodoModel _todoModel = TodoModel(
                          todoModel[index].id,
                          todoModel[index].title,
                          todoModel[index].description,
                          todoModel[index].tag,
                          isComplete);
                      final update = context.read<TodoCubit>();
                      update.updateTodo(_todoModel);
                      update.getTodoList();

                    }
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(todoModel[index].title),
                        Text(todoModel[index].description,
                            style: TextStyle(
                              color: ColorApp.description,
                            )),
                      ],
                    ),
                  ),
                  Text(
                    todoModel[index].tag,
                    style: TextStyle(backgroundColor: ColorApp.bgTag),
                  ),
                ],
              );
            },
          ),
        )),
  );
}