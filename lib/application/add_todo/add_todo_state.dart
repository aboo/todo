part of 'add_todo_bloc.dart';

@freezed
class AddTodoState with _$AddTodoState {
  const factory AddTodoState({
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required List<Tag> tags,
    required bool shouldNavigateToHomePage,
    required bool isInViewMode,
  }) = _AddTodoState;

  factory AddTodoState.initial(Todo? todo) => AddTodoState(
        titleController: TextEditingController(text: todo?.title),
        descriptionController: TextEditingController(text: todo?.description),
        tags: todo?.tags ?? [],
        shouldNavigateToHomePage: false,
        isInViewMode: todo != null,
      );
}
