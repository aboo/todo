import 'package:flutter/cupertino.dart';
import 'package:todo/app/todoList/pages/create_todo_page.dart';
import 'package:todo/app/todoList/pages/todo_page.dart';

final routes = {
  '/todoPage': (BuildContext context) => new TodoPage(),
  '/createTodo': (BuildContext context) => new CreateTodoPage(),

};