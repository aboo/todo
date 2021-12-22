part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.initialized() = HomePageInitialized;
  const factory HomePageEvent.checkButtonPressed(Todo todo) =
      HomePageCheckButtonPressed;
  const factory HomePageEvent.deleteButtonPressed(Todo todo) =
      HomePageDeleteButtonPressed;
  const factory HomePageEvent.todoReorderd(int oldIndex, int newIndex) =
      HomePageTodoReordered;
  const factory HomePageEvent.filtersChanged(
      bool showRemainedTodos, List<Tag> selectedTags) = HomePageFiltersChanged;
  const factory HomePageEvent.gotBackFromAddTodoPage() =
      HomePageGotbackFromAddTodoPage;
}
