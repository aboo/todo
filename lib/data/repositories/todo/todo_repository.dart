import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/data/providers/storage/credit/credit_storage.dart';
import 'package:todo/data/providers/storage/database/app_database.dart';
import 'package:todo/data/providers/storage/database/dao/todo_dao.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';

final todoRepositoryProvider = Provider<Future<TodoRepository>>((ref) async {
  final credStorage = ref.watch(creditStorageProvider);
  final database = await ref.watch(appDataBaseProvider);
  final todoDao = database.todoDao;
  return TodoRepository(todoDao, credStorage);
});

class TodoRepository {
  final ToDoDao toDoDao;
  final CreditStorage creditStorage;

  TodoRepository(this.toDoDao, this.creditStorage);

  Future<List<ToDoEntity>> findAll({int limit = 10, int offset = 0}) async {
    final userId = await creditStorage.readUserId();
    return toDoDao.findAll(userId, limit, offset);
  }

  Future<List<ToDoEntity>> filter(int tagId, int status,
      {int limit = 10, int offset = 0}) async {
    final userId = await creditStorage.readUserId();
    return toDoDao.filter(tagId, status, userId, limit, offset);
  }

  Future<ToDoEntity?> getToDoEntity(int id) async {
    final userId = await creditStorage.readUserId();
    return toDoDao.findToDoEntity(id, userId);
  }

  Future<int> saveToDoEntity(ToDoEntity toDoEntity) {
    return toDoDao.insertToDoEntity(toDoEntity);
  }

  Future<void> updateToDoEntity(ToDoEntity toDoEntity) {
    return toDoDao.updateToDoEntity(toDoEntity);
  }

  Future<void> deleteAll() async {
    final userId = await creditStorage.readUserId();
    return toDoDao.deleteAll(userId);
  }

  Future<void> delete(int id) {
    return toDoDao.delete(id);
  }
}
