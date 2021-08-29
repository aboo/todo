import 'dart:async';

import 'package:floor/floor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:todo/data/providers/storage/database/dao/todo_dao.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';

part 'app_database.g.dart';

final appDataBaseProvider = Provider<Future<AppDatabase>>((_) {
  return $FloorAppDatabase.databaseBuilder('todo-app.db').build();
});

@Database(version: 1, entities: [ToDoEntity])
abstract class AppDatabase extends FloorDatabase {
  ToDoDao get todoDao;
}
