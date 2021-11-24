import 'package:flutter/material.dart';
import 'package:todo/data_models/todo.dart';
import 'package:todo/sql_service/sql_services.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList;
  List<Todo> filteredTodoList = [];
  List<String> tags = [];
  List<String> selectedTags = [];
  bool filterByCompleteItem = true;
  bool filterByPendingItem = true;
  bool disableTagFiler = true;
  bool firstInsertSort = false;

  TodoProvider(this.todoList) {
    filteredTodoList = todoList;
    filterList();
    for (Todo element in todoList) {
      for (var tag in element.tags) {
        if (!tags.contains(tag)) {
          tags.add(tag);
        }
      }
    }
  }

  void updateFirstInsertSort(){
    firstInsertSort = !firstInsertSort;
    filterList();
    notifyListeners();
  }
  void updateFilterByCompleteTag(bool val){
    filterByCompleteItem = val;
    filterList();
    notifyListeners();
  }
  void updateFilterByPendingTag(bool val){
    filterByPendingItem = val;
    filterList();
    notifyListeners();
  }
  void updateDisableTagFilter(bool val){
    disableTagFiler = val;
    if(disableTagFiler == true){
      selectedTags.clear();
    }
    filterList();
    notifyListeners();
  }

  void addTagToFilter(String tag){
    selectedTags.add(tag);
    disableTagFiler = false;
    filterList();
    notifyListeners();
  }

  void removeTagInFilter(String tag){
    selectedTags.removeWhere((element) => element==tag);
    filterList();
    notifyListeners();
  }


  void updateCheckTask(bool check, int id) {
    SqLiteService.updateCheck(check, id);
    filteredTodoList.firstWhere((element) => element.id == id).isComplete =
    check ? 1 : 0;
    filterList();
    notifyListeners();
  }

  void deleteItem(int id) {
    SqLiteService.delete(id);
    filteredTodoList.removeWhere((element) => element.id == id);
    filterList();
    notifyListeners();
  }

  void updateTodoItem(Todo todo) {
    filteredTodoList.firstWhere((element) => element.id == todo.id)
      ..tags = todo.tags
      ..title = todo.title
      ..description = todo.description;
    filterList();
    notifyListeners();
  }

  void addItem(Todo todo) {
    todoList.add(todo);
    filterList();
    notifyListeners();
  }

  //we call this in every action
  void filterList(){
    if(filterByPendingItem && !filterByCompleteItem){
      filteredTodoList = todoList.where((element) => element.isComplete == 0).toList();
    }else if(!filterByPendingItem && filterByCompleteItem){
      filteredTodoList = todoList.where((element) => element.isComplete == 1).toList();
    }else if(filterByCompleteItem && filterByPendingItem){
      filteredTodoList = todoList;
    }else{
      filteredTodoList = [];
    }

    if(!disableTagFiler){
      for (var selectedTag in selectedTags) {
        filteredTodoList = filteredTodoList.where((element) => element.tags.contains(selectedTag)).toList();
      }
    }

    if(firstInsertSort){
      filteredTodoList.sort((a,b)=>a.id.compareTo(b.id));
    }else{
      filteredTodoList.sort((a,b)=>b.id.compareTo(a.id));
    }
  }
}
