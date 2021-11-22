import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app_challenge/models/task.dart';
import 'package:todo_app_challenge/viewmodels/main_page_viewmodel.dart';
import 'package:todo_app_challenge/viewmodels/main_page_viewmodel.dart';
import 'package:todo_app_challenge/views/add_task_page.dart';
import 'package:todo_app_challenge/views/edit_page.dart';

import '../service_locator.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
      viewModelBuilder: () => getIt<MainPageViewModel>(),
      onModelReady: (model) => model.getTasks(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.green.shade300,
                  child: Center(
                    child: Text(
                      '${model.tasks.length}',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Todo List",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TaskCard(
                          task: model.tasks[index],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Get.to(AddTask());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskCard extends ViewModelWidget<MainPageViewModel> {
  Task task;
  TaskCard({@required this.task});

  @override
  Widget build(BuildContext context, MainPageViewModel model) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: (task.isDone) ? Colors.green : Colors.black),
            ),
            Checkbox(
              value: task.isDone,
              onChanged: (value) async {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () async {},
              child: const Text(
                "Delete",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
              ),
              onPressed: () {
                Get.to(EditTaskPage(task: task));
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        children: [Text(task.description)],
                      );
                    });
              },
              child: const Text(
                "detail",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
