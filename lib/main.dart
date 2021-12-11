import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/view/Home_view.dart';

void main() async{
   Hive.registerAdapter(TaskAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Task>('takes');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeView(),
    );
  }

  
}
