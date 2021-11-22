import 'package:get_it/get_it.dart';
import 'package:todo_app_challenge/hive_services.dart';
import 'package:todo_app_challenge/viewmodels/add_page_viewmodel.dart';
import 'package:todo_app_challenge/viewmodels/main_page_viewmodel.dart';

GetIt getIt = GetIt.instance;
setUpGetIt() {
  getIt.registerFactory(() => MainPageViewModel(hiveServices: HiveServices()));
  getIt.registerFactory(() => AddTaskViewModel(hiveServices: HiveServices()));
}
