import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo/config/app_routes.dart';

void main() {
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
