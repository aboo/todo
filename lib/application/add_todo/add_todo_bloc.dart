import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/data/tag/tag_repository.dart';
import 'package:todo/data/todo/todo_repository.dart';
import 'package:todo/domain/tag.dart';
import 'package:todo/domain/todo.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';
part 'add_todo_bloc.freezed.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  AddTodoBloc({
    required this.todoRepository,
    required this.tagRepository,
    this.todo,
  }) : super(AddTodoState.initial(todo)) {
    on<AddTodoTagAdded>(_tagAdded);
    on<AddTodoSaveButtonPressed>(_saveButtonPressed);
    on<AddTodoEditViewButtonPressed>(_editViewButtonPressed);
  }

  final TodoRepository todoRepository;
  final TagRepository tagRepository;
  final Todo? todo;

  void _tagAdded(AddTodoTagAdded event, Emitter<AddTodoState> emit) {
    List<Tag> tags = [];
    tags.addAll(state.tags);
    Tag tag = Tag.newInstance(event.tag);
    tags.add(tag);
    emit(state.copyWith(tags: tags));
  }

  void _editViewButtonPressed(_, Emitter<AddTodoState> emit) {
    emit(state.copyWith(isInViewMode: !state.isInViewMode));
  }

  void _saveButtonPressed(_, Emitter<AddTodoState> emit) async {
    Todo todo = Todo.newInstance(
      state.titleController.text,
      state.descriptionController.text,
      state.tags,
    );
    await todoRepository.addTodo(todo);
    await Future.forEach(
      state.tags,
      (tag) => tagRepository.addTag(tag as Tag),
    );
    emit(state.copyWith(shouldNavigateToHomePage: true));
  }
}
