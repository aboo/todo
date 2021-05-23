import 'package:flutter/material.dart';
import 'package:todo/services/navigator_service.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService(context);

    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: navigationService.routes,
      initialRoute: navigationService.initialRoute,
    );
  }
}
