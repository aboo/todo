import 'dart:convert';

import 'package:todo/services/map_helper.dart';

class TodoViewModel {
  int id;
  String title;
  String description;
  List<String> tags;
  bool finished;

  TodoViewModel({
    this.id,
    this.title,
    this.description = "",
    this.tags,
    this.finished = false,
  }) {
    tags = [];
  }

  TodoViewModel fromJson(Map<String, dynamic> map) {
    MapHelper mapHelper = MapHelper(map);

    List<dynamic> lisTags = map["tags"];
    List<String> tags = lisTags.map((e) => e.toString()).toList();

    return TodoViewModel(
      id: mapHelper.getData("id"),
      title: mapHelper.getData("title"),
      description: mapHelper.getData("description"),
      tags: tags,
      finished: mapHelper.getData("finished"),
    );
  }

  List<TodoViewModel> fromJsonArray(String data) {
    if (data == null || data.isEmpty) return null;
    List<TodoViewModel> response = [];
    List<dynamic> list = json.decode(data);

    try {
      list.forEach((element) {
        response.add(TodoViewModel().fromJson(element));
      });
    } catch (e) {
      print(e);
    }
    print("don");
    return response;
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tags': tags,
      'finished': finished,
    };
  }
}
