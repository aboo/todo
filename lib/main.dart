import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/config/app_routes.dart';
import 'package:todo/config/config_strings.dart';
import 'models/todo_model.dart';

void main() async {
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.initFlutter();

  await Hive.openBox<TodoModel>(ConfigStrings.TODO_BOX);
  print("reg3");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.todoList,
      getPages: AppRoutes.getPages(),
    );
  }
}
