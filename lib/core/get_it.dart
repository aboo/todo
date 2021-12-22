import 'package:get_it/get_it.dart';
import 'package:todo/application/add_todo/add_todo_bloc.dart';
import 'package:todo/application/home_page/home_page_bloc.dart';
import 'package:todo/data/db/database.dart';
import 'package:todo/data/db/database_impl.dart';
import 'package:todo/data/tag/tag_repository.dart';
import 'package:todo/data/tag/tag_repository_impl.dart';
import 'package:todo/data/todo/todo_repository.dart';
import 'package:todo/data/todo/todo_repository_impl.dart';
import 'package:todo/domain/todo.dart';

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

  // Factories
  getIt.registerFactoryParam<AddTodoBloc, Todo?, void>(
    (todo, _) => AddTodoBloc(
      todoRepository: getIt<TodoRepository>(),
      tagRepository: getIt<TagRepository>(),
      todo: todo,
    ),
  );

  getIt.registerFactory<HomePageBloc>(
    () => HomePageBloc(
      todoRepository: getIt<TodoRepository>(),
      tagRepository: getIt<TagRepository>(),
    ),
  );
}
