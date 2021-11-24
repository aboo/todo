import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class SqLiteService {


  static Future<int> insert(Map<String,dynamic> map)async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'TodoList.db');
    Database database = await openDatabase(path, version: 1);
    final Database db = database;
    dynamic res = await db.insert('items', map,conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

}
