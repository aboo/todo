part of 'add_todo_bloc.dart';

@freezed
class AddTodoEvent with _$AddTodoEvent {
  const factory AddTodoEvent.tagAdded(String tag) = AddTodoTagAdded;
  const factory AddTodoEvent.saveButtonPressed() = AddTodoSaveButtonPressed;
}
