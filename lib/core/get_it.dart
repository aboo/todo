import 'package:get_it/get_it.dart';
import 'package:todo/data/db/database.dart';
import 'package:todo/data/db/database_impl.dart';
import 'package:todo/data/tag/tag_repository.dart';
import 'package:todo/data/tag/tag_repository_impl.dart';
import 'package:todo/data/todo/todo_repository.dart';
import 'package:todo/data/todo/todo_repository_impl.dart';

GetIt getIt = GetIt.instance;

void setUpGetIt() {
  // Singletons
  getIt.registerSingleton<DataBase>(DatabaseImpl());
  getIt.registerSingleton<TodoRepository>(
    TodoRepositoryImpl(
      db: getIt<DataBase>(),
    ),
  );
  getIt.registerSingleton<TagRepository>(
    TagRepositoryImpl(
      db: getIt<DataBase>(),
    ),
  );
}
