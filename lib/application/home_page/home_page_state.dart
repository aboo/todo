part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = HomePageInitial;
  const factory HomePageState.success({
    required List<Todo> todos,
    required List<Tag> tags,
    required int remainedTodos,
    required bool showRemainedTodos,
    required List<Tag> selectedTags,
  }) = HomePageSuccess;
  const factory HomePageState.empty() = HomePageEmpty;
  const factory HomePageState.failure() = HomePageFailure;
}
