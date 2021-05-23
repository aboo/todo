import 'package:flutter/cupertino.dart';
import 'package:todo/services/shared_preferences_service.dart';
import 'package:todo/viewModels/todo_view_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoViewModel> _listItems = [];
  List<String> _listFilterTags = [];
  List<TodoViewModel> get listItems => _listItems;
  List<String> get listFilterTags => _listFilterTags;

  int _getLastItemId() {
    if (_listItems?.isNotEmpty == true) return _listItems.last.id;
    return 0;
  }

  setNewTask({@required String title, String description, List<String> tags}) {
    int newId = _getLastItemId() + 1;
    var newTask = TodoViewModel(
      id: newId,
      title: title,
      description: description,
      tags: tags,
    );
    _listItems.add(newTask);
    notifyListeners();
  }

  updateTask(TodoViewModel todoViewModel) {
    var model =
        _listItems.firstWhere((element) => element.id == todoViewModel.id);
    model.title = todoViewModel.title;
    model.description = todoViewModel.description;
    model.tags = todoViewModel.tags;
    model.finished = todoViewModel.finished;
    notifyListeners();
  }

  deleteTask(TodoViewModel todoViewModel) {
    _listItems.removeWhere((element) => element.id == todoViewModel.id);
  }

  String getTaskCount() {
    return (_listItems?.length ?? 0).toString();
  }

  void finishUpTask({TodoViewModel todoViewModel, bool newStatus}) {
    todoViewModel.finished = newStatus;
    notifyListeners();
  }

  TodoViewModel getTaskById(int id) {
    return _listItems.firstWhere((element) => element.id == id);
  }

  List<String> getAllTags() {
    List<String> allTags = [];
    _listItems?.forEach((element) {
      allTags.addAll(element.tags);
    });
    return allTags;
  }

  void onClickTagFilter(String tag) {
    if (_listFilterTags.any((element) => element == tag)) {
      _listFilterTags.removeWhere((element) => element == tag);
    } else {
      _listFilterTags.add(tag);
    }
    notifyListeners();
  }

  void saveData(BuildContext context) {
    SharedPreferencesService(context).saveData(listItems);
  }

  void init(List<TodoViewModel> data) {
    _listItems = data ?? [];
    notifyListeners();
  }
}
