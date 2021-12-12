import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/screens/edit_todo_page.dart';
import 'package:todo/screens/new_todo_page.dart';
import 'package:todo/screens/todo_list_page.dart';

class AppRoutes {
  static const String todoList = "/todolist";
  static const String newTodo = "/newTodo";
  static const String editTodo = "/editTodo";

  static List<GetPage<dynamic>> getPages() => [
        GetPage(name: todoList, page: () => TodoListPage()),
        GetPage(name: newTodo, page: () => NewTodoPage()),
        GetPage(name: editTodo, page: () => EditTodoPage()),
      ];
}
