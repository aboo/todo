import 'package:bloc/bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:meta/meta.dart';
import 'package:todo/app/db/todo_database.dart';
import 'package:todo/app/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoDatabase todoDatabase;

  TodoCubit(this.todoDatabase) : super(TodoInitial());

  Future<void> getTodoList() async {
    try {
      emit(TodoLoading());
      final todoList = await TodoDatabase.getAll();
      emit(TodoListLoaded(todoList));
    } on FetchException {
      emit(TodoError(translate('errorMessage')));
    }
  }

  Future<void> createTodo(TodoModel todoModel) async {
    try {
      emit(TodoLoading());
      final todo = await TodoDatabase.create(todoModel);
      emit(TodoCreateDatabase(todo));
    } on FetchException {
      emit(TodoError(translate('errorMessage')));
    }
  }

  Future<void> deleteTodo(id) async {
    try {
      emit(TodoLoading());
      await TodoDatabase.delete(id);
      emit(TodoDelete(id));
    } on FetchException {
      emit(TodoError(translate('errorMessage')));
    }
  }

  Future<void> updateTodo(TodoModel todoModel) async {
    try {
      emit(TodoLoading());
      final todo = await TodoDatabase.update(todoModel);
      emit(TodoUpdate(todo));
    } on FetchException {
      emit(TodoError(translate('errorMessage')));
    }
  }

  Future<void> getTodo(TodoModel todoModel) async {
    try {
      emit(TodoLoading());
      emit(TodoLoaded(todoModel));
    } on FetchException {
      emit(TodoError(translate('errorMessage')));
    }
  }
}
