import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
  String filter = 'all';

  void setFilter(String f) {
    filter = f;
    notifyListeners();
  }
}
