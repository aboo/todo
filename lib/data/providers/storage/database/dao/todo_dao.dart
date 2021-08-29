import 'package:floor/floor.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';

@dao
abstract class ToDoDao {
  @Query(
      'SELECT * FROM ToDoEntity WHERE userId = :userId ORDER BY id DESC LIMIT :limit OFFSET :offset')
  Future<List<ToDoEntity>> findAll(int userId, int limit, int offset);

  @Query(
      'SELECT * FROM ToDoEntity WHERE userId = :userId AND tagId = :tagId AND status = :status ORDER BY id DESC LIMIT :limit OFFSET :offset')
  Future<List<ToDoEntity>> filter(
      int tagId,
      int status,
      int userId ,
      int limit,
      int offset);

  @Query('SELECT * FROM ToDoEntity WHERE id = :id AND userId = :userId')
  Future<ToDoEntity?> findToDoEntity(int id, int userId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertToDoEntity(ToDoEntity toDoEntity);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateToDoEntity(ToDoEntity toDoEntity);

  @Query('DELETE FROM ToDoEntity WHERE userId = :userId')
  Future<void> deleteAll(int userId);

  @Query('DELETE FROM ToDoEntity WHERE id = :id')
  Future<void> delete(int id);
}
