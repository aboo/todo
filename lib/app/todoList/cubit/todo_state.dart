part of 'todo_cubit.dart';

@immutable
abstract class TodoState {
  const TodoState();
}

class TodoCreateDatabase extends TodoState {
  final List<TodoModel> todoModel;
  TodoCreateDatabase(this.todoModel);
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoListLoaded extends TodoState {
  final List<TodoModel> todoModel;
  const TodoListLoaded(this.todoModel);
}

class TodoUpdate extends TodoState {
  final TodoModel todoModel;
  const TodoUpdate(this.todoModel);
}

class TodoDelete extends TodoState {
  final String id;
  TodoDelete(this.id);
}

class TodoLoaded extends TodoState {
  final TodoModel todoModel;

  const TodoLoaded(this.todoModel);
}

class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoError &&
              runtimeType == other.runtimeType &&
              message == other.message;

  @override
  int get hashCode => message.hashCode;
}
