import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/domain/tag.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const Todo._();

  @JsonSerializable(explicitToJson: true)
  const factory Todo({
    required String id,
    required String title,
    required String description,
    required List<Tag> tags,
    required bool isCompleted,
  }) = _Todo;

  factory Todo.newInstance(String title, String description, List<Tag> tags) =>
      Todo(
        id: const Uuid().v1(),
        title: title,
        description: description,
        tags: tags,
        isCompleted: false,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
