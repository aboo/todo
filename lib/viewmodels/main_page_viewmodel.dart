import 'package:stacked/stacked.dart';
import 'package:todo_app_challenge/hive_services.dart';
import 'package:todo_app_challenge/models/task.dart';

class MainPageViewModel extends BaseViewModel {
  List tasks = [];
  HiveServices hiveServices;
  MainPageViewModel({required this.hiveServices});

  getTasks() {
    setBusy(true);
    tasks = hiveServices.getTasks();
    notifyListeners();
    setBusy(false);
  }
}
