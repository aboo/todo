import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:todo/data_models/todo.dart';

class SqLiteService {


  static Future<int> insert(Map<String,dynamic> map)async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'TodoList.db');
    Database database = await openDatabase(path, version: 1);
    final Database db = database;
    dynamic res = await db.insert('items', map,conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  static Future<List<Todo>> getTodoItems()async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'TodoList.db');
    Database db = await openDatabase(path, version: 1);
    List<Map<String, dynamic>> dataMap = await db.query('items');
    List<Todo> todoList= Todo.getTodoListFromDB(dataMap);
    return todoList;
  }

  static Future<void> updateCheck(bool val,int id)async{
    Map<String,dynamic> map = {"isComplete":val?1:0};
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'TodoList.db');
    Database database = await openDatabase(path, version: 1);
    final Database db = database;
    await db.update('items', map,where: 'ID = ?',whereArgs: [id]);
  }

}
