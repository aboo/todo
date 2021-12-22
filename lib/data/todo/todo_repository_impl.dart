import 'package:todo/data/db/database.dart';
import 'package:todo/data/todo/todo_repository.dart';
import 'package:todo/domain/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl({required this.db});

  static const String todosCollection = 'todos_collection';

  final DataBase db;

  @override
  Future<List<Todo>> getAllTodos() async {
    try {
      List<Map<String, dynamic>> todosJson = await db.readAll(todosCollection);
      return todosJson.map((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTodo(Todo todo) async {
    try {
      await db.create(todosCollection, todo.id, todo.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      await db.update(todosCollection, todo.id, todo.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      await db.delete(todosCollection, todo.id);
    } catch (e) {
      rethrow;
    }
  }
}
