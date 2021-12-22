import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/data/tag/tag_repository.dart';
import 'package:todo/data/todo/todo_repository.dart';
import 'package:todo/domain/tag.dart';
import 'package:todo/domain/todo.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required this.todoRepository,
    required this.tagRepository,
  }) : super(const HomePageInitial()) {
    on<HomePageInitialized>(_pageIntialized);
    on<HomePageCheckButtonPressed>(_checkButtonPressed);
    on<HomePageDeleteButtonPressed>(_deleteButtonPressed);
    on<HomePageTodoReordered>(_todoReordered);
    on<HomePageFiltersChanged>(_filtersChanged);
    on<HomePageGotbackFromAddTodoPage>(_gotbackFromAddTodoPage);
  }

  TodoRepository todoRepository;
  TagRepository tagRepository;

  late List<Todo> allTodos;

  void _pageIntialized(_, Emitter<HomePageState> emit) async {
    await _getTodos(emit, pageInitialized: true);
  }

  void _gotbackFromAddTodoPage(_, Emitter<HomePageState> emit) async {
    await _getTodos(emit);
  }

  void _checkButtonPressed(
    HomePageCheckButtonPressed event,
    Emitter<HomePageState> emit,
  ) async {
    HomePageSuccess currentState = state as HomePageSuccess;
    Todo updatedTodo =
        event.todo.copyWith(isCompleted: !event.todo.isCompleted);
    await todoRepository.updateTodo(updatedTodo);
    await _getTodos(emit);
    _filterTodos(
      allTodos,
      currentState.showRemainedTodos,
      currentState.selectedTags,
      emit,
    );
  }

  void _deleteButtonPressed(
    HomePageDeleteButtonPressed event,
    Emitter<HomePageState> emit,
  ) async {
    HomePageSuccess currentState = state as HomePageSuccess;
    await todoRepository.deleteTodo(event.todo);
    await _getTodos(emit);
    if (allTodos.isNotEmpty) {
      _filterTodos(
        allTodos,
        currentState.showRemainedTodos,
        currentState.selectedTags,
        emit,
      );
    }
  }

  void _todoReordered(
    HomePageTodoReordered event,
    Emitter<HomePageState> emit,
  ) {
    HomePageSuccess currentState = state as HomePageSuccess;
    List<Todo> updatedList = [];
    updatedList.addAll(currentState.todos);
    int oldIndex = event.oldIndex;
    int newIndex =
        event.newIndex > oldIndex ? event.newIndex - 1 : event.newIndex;
    Todo todo = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, todo);
    emit(currentState.copyWith(todos: updatedList));
  }

  void _filtersChanged(
    HomePageFiltersChanged event,
    Emitter<HomePageState> emit,
  ) {
    HomePageSuccess currentState = state as HomePageSuccess;
    _filterTodos(
      allTodos,
      event.showRemainedTodos,
      event.selectedTags,
      emit,
    );
  }

  // README: The chosen database for this app, loads all the db content into memory when opening
  // the app, so reading from this db is a cheap operation, as so ive decided to reFetch the
  // data from db after each object manipulation since it is less error prone than manipulating
  // objects in a mutable list.

  Future<void> _getTodos(
    Emitter<HomePageState> emit, {
    bool pageInitialized = false,
  }) async {
    try {
      allTodos = await todoRepository.getAllTodos();
      List<Tag> tags = await tagRepository.getAllTags();
      if (allTodos.isNotEmpty) {
        int remainedTodos = allTodos.where((todo) => !todo.isCompleted).length;
        if (pageInitialized || state is HomePageEmpty) {
          emit(
            HomePageState.success(
              todos: allTodos,
              tags: tags,
              remainedTodos: remainedTodos,
              showRemainedTodos: false,
              selectedTags: [],
            ),
          );
        } else {
          final currentState = state as HomePageSuccess;
          emit(
            currentState.copyWith(
              todos: allTodos,
              remainedTodos: remainedTodos,
            ),
          );
        }
      } else {
        emit(const HomePageState.empty());
      }
    } catch (e) {
      emit(const HomePageState.failure());
    }
  }

  void _filterTodos(
    List<Todo> todos,
    bool showRemainedTodos,
    List<Tag> selectedTags,
    Emitter<HomePageState> emit,
  ) {
    HomePageSuccess currentState = state as HomePageSuccess;
    final filteredByStatus = _filterByStatus(todos, showRemainedTodos);
    final filteredByTags = _filterByTag(filteredByStatus, selectedTags);
    emit(currentState.copyWith(
      todos: filteredByTags,
      showRemainedTodos: showRemainedTodos,
      selectedTags: selectedTags,
    ));
  }

  List<Todo> _filterByStatus(
    List<Todo> todos,
    bool showRemainedTodos,
  ) {
    if (showRemainedTodos) {
      return todos.where((todo) => !todo.isCompleted).toList();
    } else {
      return todos;
    }
  }

  List<Todo> _filterByTag(
    List<Todo> todos,
    List<Tag> selectedTags,
  ) {
    if (selectedTags.isNotEmpty) {
      return todos.where((todo) {
        bool foundTag = false;
        todo.tags.forEach((tag) {
          if (selectedTags.contains(tag)) {
            foundTag = true;
          }
        });
        return foundTag;
      }).toList();
    } else {
      return todos;
    }
  }
}
