import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/controller/add_task_controller.dart';
import 'package:todo/controller/edit_task_controller.dart';
import 'package:todo/controller/home_controller.dart';
import 'package:todo/model/task_model.dart';

final tasksBoxProvider = Provider<Box<Task>>((ref) {
  return Hive.box('takes');
});

final homeController =
    ChangeNotifierProvider<HomeNotifier>((ref) => HomeNotifier());
final addTaskController = ChangeNotifierProvider.autoDispose<AddTaskNotifier>(
    (ref) => AddTaskNotifier());

final editTaskController = ChangeNotifierProvider.autoDispose<EditTaskNotifier>(
    (ref) => EditTaskNotifier());
