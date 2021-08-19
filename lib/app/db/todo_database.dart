import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:todo/app/model/todo_model.dart';

class TodoDatabase {
  static Future<sql.Database> database() async {
    final database = sql.openDatabase(
        path.join(await sql.getDatabasesPath(), 'todo_database.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todos(id TEXT PRIMARY KEY, title TEXT, description TEXT, '
        'tag TEXT, isComplete INTEGER)',
      );
    }, version: 1);
    return database;
  }

  static Future<List<TodoModel>> getAll() async {
    final db = await TodoDatabase.database();

    final result = await db.query('todos');

    final List<TodoModel> toDoList =
        result.map((e) => TodoModel.fromJson(e)).toList();

    return toDoList;
  }

  static Future create(TodoModel todo) async {
    final db = await TodoDatabase.database();

    await db.insert(
      'todos',
      todo.toJson(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future delete(String id) async {
    final db = await TodoDatabase.database();

    await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  static Future update(TodoModel toDo) async {
    final db = await TodoDatabase.database();

    await db
        .update('todos', toDo.toJson(), where: 'id = ?', whereArgs: [toDo.id]);
  }
}

class FetchException implements Exception {}
