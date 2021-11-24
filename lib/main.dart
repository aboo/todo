import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/sql_service/sql_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<void> createDBIfNotExists() async {
    //open the TodoList db and create table with name items
    openDatabase(
      join(await getDatabasesPath(), 'TodoList.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS items ( ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title VARCHAR(100) NOT NULL , description TEXT NOT NULL , tags JSON NOT NULL , year VARCHAR(4) NOT NULL ,month VARCHAR(2) NOT NULL ,day VARCHAR(2) NOT NULL , isComplete INT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    //call create app
    createDBIfNotExists();

    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: SqLiteService.getTodoItems(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider.value(
              value: TodoProvider(snapshot.data),
              child: const HomePage(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
