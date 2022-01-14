import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/viewmodel/todo_viewmodel.dart';
import 'package:todo/views/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<TodoViewModel>(
          create: (context) => TodoViewModel(context)
          ,child: MaterialApp(
        title: 'ToDo Application Challenge',
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/Home",
        routes: {
          "/Home":(context) =>  Home(),
        },
      ));
  }
}


