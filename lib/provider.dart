import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task_model.dart';

final tasksBoxProvider = Provider<Box<Task>>((ref) {
  return Hive.box('takes');
});
