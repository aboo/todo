import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/viewModels/todo_view_model.dart';

class SharedPreferencesService {
  BuildContext context;
  SharedPreferencesService(this.context);

  String dataTag = "myTag";

  saveData(List<TodoViewModel> listItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonData = jsonEncode(listItems.map((e) => e.toJson()).toList());
    prefs.setString(dataTag, jsonData);
  }

  Future<List<TodoViewModel>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString(dataTag);
    return TodoViewModel().fromJsonArray(jsonData);
  }
}
