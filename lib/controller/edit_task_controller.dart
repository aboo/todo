import 'package:flutter/material.dart';

class EditTaskNotifier extends ChangeNotifier {
  List<String> tags = [];

  void removeTag(tag) {
    tags.remove(tag);
    notifyListeners();
  }

  void addTags() {
    notifyListeners();
  }
}
