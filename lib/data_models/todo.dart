import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  int id;
  String title;
  String description;
  List<String> tags;
  String year;
  String month;
  String day;
  int isComplete;

  Todo(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.tags,
      @required this.year,
      @required this.month,
      @required this.day,
      @required this.isComplete});

  Map<String, dynamic> toInsertMap() {
    return {
      'title': title,
      'description': description,
      'year': year,
      'month': month,
      'day': day,
      'tags': json.encode(tags),
      'isComplete': 0,
    };
  }

  static Todo fromJson(Map map) {
    debugPrint(map.toString());
    return Todo(
        id: map['ID'],
        title: map['title'],
        description: map['description'],
        tags: json.decode(map['tags']).cast<String>(),
        year: map['year'],
        month: map['month'],
        day: map['day'],
        isComplete: map['isComplete']);
  }

  static List<Todo> getTodoListFromDB(List<Map<String, dynamic>> map) {
    return List.generate(
      map.length,
      (index) {
        return fromJson(map[index]);
      },
    );
  }
}
