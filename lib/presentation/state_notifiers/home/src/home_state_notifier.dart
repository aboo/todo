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

  Future<void> getAllToDoList() async {
    try {
      state = const HomeState.loading();
      final data = await (await repository).findAll();
      state = HomeState.data(data);
    } catch (e, s) {
      state = const HomeState.error(Strings.someErrorHappened);
    }
  }

  Future<void> filterTodoList({required int tagId, required int status}) async {
    try {
      state = const HomeState.loading();
      final data = await (await repository).filter(tagId, status);
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
