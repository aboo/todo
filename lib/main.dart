import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/my_app.dart';
import 'package:todo/providers/todo_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoProvider>(
        create: (context) => TodoProvider(),
      ),
    ],
    child: TodoApp(),
  ));
}
