import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/models/todo_item.dart';


class TodoViewModel extends ChangeNotifier {
  List<TodoItem> todos = [];
  BuildContext context;


  TodoViewModel(this.context);

  void createTodo({required String title,
    required String description,
    required String tags,
    required status}) {


    if(description.isNotEmpty && title.isNotEmpty && tags.isNotEmpty){

      final todo = TodoItem(title: title,
          description: description,
          tags: splitTags(tags),
          status: status);

      todos.add(todo);
      showMesseage(msg: "Todo Added!");
      notifyListeners();

      //Navigator.pop(context);
    }else{
      showMesseage(msg: "Enter All fields!");
    }

    // Provider.of<TodoViewModel>(context, listen: false).getNoneDeletedTodos();


  }

  List<String> splitTags(String tags)
  {
    List<String> tagsList;
    return  tagsList = tags.split(",");

  }



  void markComplete({required TodoItem todoItem})
  {
    if(todoItem.status!="Complete") {
      todoItem.status = "Complete";
      notifyListeners();
    }else{
      showMesseage(msg: "This Task is Already Completed!");
    }
  }
  void markPending({required TodoItem todoItem})
  {
    if(todoItem.status=="Complete") {
      todoItem.status = "Pending";
      notifyListeners();
    }else{
      showMesseage(msg: "This Task is Already Pending!");
    }
  }

  void deleteTask({required TodoItem todoItem})
  {
    if(todoItem.status!="Deleted") {
      todoItem.status = "Deleted";
      notifyListeners();

    }
  }
  void doneTask({required TodoItem todoItem})
  {
    if(todoItem.status!="Deleted") {
      todoItem.status = "Done";
      notifyListeners();
    }else if(todoItem.status=="Done"){
      todoItem.status = "Pending";
      notifyListeners();
    }
  }
  void sortDeleted(){
    todos.sort((a, b) => a.status.compareTo(b.status));
    notifyListeners();
  }



  void showMesseage({required String msg})
  {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }


  getNoneDeletedTodos(){
    return todos;
  }



}