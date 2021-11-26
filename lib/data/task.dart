import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

@JsonSerializable()
class Task {
  final String id;
  String title;
  String? description;
  List<String>? tags;
  bool isDone;
  String? referenceId;
  int? order;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.tags,
    this.isDone = false,
    this.referenceId,
    this.order,
  });
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  // Task.fromJson(Map<dynamic, dynamic> json)
  //     : id = json['id'] as int,
  //       title = json['id'] as String,
  //       description = json['description'] as String,
  //       tags = json['tags'] as List<Tag>,
  //       isDone = json['isDone'] as bool;
  //
  // Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  //   'id': id,
  //   'title': title,
  //   'description': description,
  //   'tags': tags,
  //   'isDone': isDone,
  // };
}

class Tag {
  final String name;
  final int id;

  Tag({required this.id, required this.name});
}
