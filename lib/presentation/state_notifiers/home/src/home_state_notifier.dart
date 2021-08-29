import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/configs/strings.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';
import 'package:todo/data/repositories/todo/todo_repository.dart';

import 'home_state.dart';

final homeStateNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(repository: ref.watch(todoRepositoryProvider));
});

class HomeStateNotifier extends StateNotifier<HomeState> {
  final Future<TodoRepository> repository;

  HomeStateNotifier({required this.repository}) : super(HomeState.initial());

  Future<void> getAllToDoList({int limit = 10, int offset = 0}) async {
    try {
      state = const HomeState.loading();
      //todo un comment this two line of code after todo form created
      // final data =
      //     await (await repository).findAll(limit: limit, offset: offset);
      await Future.delayed(Duration(seconds: 1));
      final data = ToDoEntity.generateFakeList();
      state = HomeState.data(data);
    } catch (e, s) {
      state = const HomeState.error(Strings.someErrorHappened);
    }
  }

  Future<void> filterTodoList(
      {required int tagId,
      required int status,
      int limit = 10,
      int offset = 0}) async {
    try {
      state = const HomeState.loading();
      final data = await (await repository)
          .filter(tagId, status, limit: limit, offset: offset);
      state = HomeState.data(data);
    } catch (e, s) {
      state = const HomeState.error(Strings.someErrorHappened);
    }
  }

  Future<void> saveToDoItem({required ToDoEntity entity}) async {
    try {
      state = const HomeState.loading();
      await (await repository).saveToDoEntity(entity);
      final data = await (await repository).findAll();
      state = HomeState.data(data);
    } catch (e, s) {
      state = const HomeState.error(Strings.someErrorHappened);
    }
  }

  Future<void> deleteToDoItem({required int id}) async {
    try {
      state = const HomeState.loading();
      await (await repository).delete(id);
      final data = await (await repository).findAll();
      state = HomeState.data(data);
    } catch (e, s) {
      state = const HomeState.error(Strings.someErrorHappened);
    }
  }
}
