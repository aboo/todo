
import 'package:rxdart/rxdart.dart';
import 'repository.dart';
import 'task.dart';

class Provider{
  Provider();

  final _loadingContent = BehaviorSubject<bool>();
  final _tasks = BehaviorSubject<List<Task>?>();
  final _selectedTask = BehaviorSubject<Task?>();

  Stream<bool> get loadingContent => _loadingContent.stream;

  Stream<List<Task>?> get tasks => _tasks.stream;

  Stream<Task?> get selectedTask => _selectedTask.stream;



  void onItemClick(Task task){
    _selectedTask.value = task;
  }

  dispose(){
    _loadingContent.close();
    _tasks.close();
    _selectedTask.close();
  }
}