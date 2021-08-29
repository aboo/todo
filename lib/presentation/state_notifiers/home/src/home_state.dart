import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.error(String message) = Error;
  const factory HomeState.data(List<ToDoEntity> data) = Data;
}