import 'package:flutter/material.dart';

class AddTaskNotifier extends ChangeNotifier {
  List<String> tags = [];

  void removeTag(tag) {
    tags.remove(tag);
    notifyListeners();
  }

  void addTags(values) {
    tags = values;
    notifyListeners();
  }
}
