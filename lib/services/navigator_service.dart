import 'package:flutter/material.dart';
import 'package:todo/screens/main_screen.dart';
import 'package:todo/screens/todo_screen.dart';

class NavigationService {
  final BuildContext context;
  NavigationService(this.context);

  String get initialRoute => MainScreen.id;

  var routes = {
    MainScreen.id: (context) => MainScreen(),
    TodoScreen.id: (context) => TodoScreen(),
  };

  push(Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  pushReplacement(Widget screen) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  pop() {
    Navigator.of(context).pop();
  }
}
