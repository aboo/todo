import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app_challenge/viewmodels/add_page_viewmodel.dart';

import 'package:todo_app_challenge/views/main_page.dart';

import '../service_locator.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
      viewModelBuilder: () => getIt<AddTaskViewModel>(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Add Task ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F2F2),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: "name",
                    hintStyle: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  onChanged: (value) {
                    model.setname(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F2F2),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: "description",
                    hintStyle: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    model.setdescription(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await model.addTask();
                    Get.off(MainPage());
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
