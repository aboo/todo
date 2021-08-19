// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:todo/app/db/todo_database.dart';
import 'package:todo/app/model/todo_model.dart';
import 'package:todo/app/todoList/cubit/todo_cubit.dart';

import 'package:todo/main.dart';


main() {
  TodoDatabase toDoDatabase = TodoDatabase();
  List<TodoModel> todoModel;
  TodoCubit cubit = TodoCubit(toDoDatabase);

  late TodoCubit counterCubit;
  group('TodoCubit', () {
    setUp(() {
      counterCubit = TodoCubit(toDoDatabase);
    });

    test('TodoState initial', () {
      expect(counterCubit.state, isA<TodoInitial>());
    });
  });

  group('db', () {
    test('check db', () {
      expect(isA<TodoDatabase>(), isNotNull);
    });
  });
}