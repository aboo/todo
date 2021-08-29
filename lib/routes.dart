import 'package:flutter/material.dart';
import 'package:todo/configs/transitions/fade_page_route.dart';
import 'package:todo/presentation/screens/create_todo/create_todo.dart';

import 'presentation/screens/home/home.dart';

abstract class NavigationPaths {
  static const String home = '/home';
  static const String createToDo = '/home/create';
}

abstract class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationPaths.home:
        return FadePageRoute(page: const HomeScreen());

      case NavigationPaths.createToDo:
        return FadePageRoute(page: const CreateToDoScreen());

      default:
        return FadePageRoute(page: const HomeScreen());
    }
  }

  static NavigatorState get _state => navigatorKey.currentState!;

  static Future push<T extends Object>(String route, [T? arguments]) =>
      _state.pushNamed(route, arguments: arguments);

  static Future replaceWith<T extends Object>(String route, [T? arguments]) =>
      _state.pushReplacementNamed(route, arguments: arguments);

  static void pop() => _state.pop();
}
