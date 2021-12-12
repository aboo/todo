import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/controllers/edit_todo_controller.dart';
import 'package:todo/controllers/todo_list_controller.dart';
import 'package:todo/screens/edit_todo_page.dart';
import 'package:todo/screens/new_todo_page.dart';
import 'package:todo/screens/todo_list_page.dart';
import 'package:todo/controllers/new_todo_controller.dart';

class AppRoutes {
  static const String todoList = "/todolist";
  static const String newTodo = "/newTodo";
  static const String editTodo = "/editTodo";

  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: todoList,
          page: () => TodoListPage(),
          binding: BindingsBuilder(() => {Get.put(TodoListController())}),
        ),
        GetPage(
          name: newTodo,
          page: () => NewTodoPage(),
          binding: BindingsBuilder(() => {Get.put(NewTodoControler())}),
        ),
        GetPage(
          name: editTodo,
          page: () => EditTodoPage(),
          binding: BindingsBuilder(() => {Get.put(EditTodoController())}),
        ),
      ];
}
