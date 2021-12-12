import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/edit_todo_controller.dart';
import 'package:todo/controllers/new_todo_controller.dart';
import 'package:todo/widgets/tag_widget.dart';

class EditTodoPage extends StatelessWidget {
  TextEditingController title = TextEditingController(),
      detail = TextEditingController(),
      newTag = TextEditingController();
  EditTodoController controler = Get.find();
  @override
  Widget build(BuildContext context) {
    controler.init(Get.arguments);
    title.text = controler.title.value;
    detail.text = controler.detial.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        actions: [
          Obx(() => InkWell(
                radius: 50,
                onTap: () async {
                  await controler.save(title.text, detail.text);
                  Get.back();
                },
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: controler.loading.value
                      ? CircularProgressIndicator()
                      : Text("SAVE"),
                )),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: title,
                decoration: InputDecoration(hintText: "Title")),
            SizedBox(height: 16),
            TextField(
                controller: detail,
                maxLines: 4,
                decoration: InputDecoration(hintText: "detail")),
            SizedBox(height: 16),
            Obx(() => CheckboxListTile(
                  title: Text("Mark as done"),
                  value: controler.markedAsDone.value,
                  onChanged: (newValue) {
                    controler.markedAsDone.value = newValue;
                  },
                  contentPadding: EdgeInsets.zero,
                )),
            TextField(
                controller: newTag,
                onSubmitted: (_) {
                  String str = newTag.text;
                  newTag.clear();
                  controler.addTag(str);
                },
                decoration: InputDecoration(
                    hintText: "endter your tag and press submit")),
            SizedBox(
              height: 16,
            ),
            Obx(() => Wrap(
                  children: controler.tags.value
                      .map((e) => TagWidget(
                            title: e,
                            onTap: () {},
                          ))
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
