import 'package:flutter/material.dart';
import 'package:todo/component/add_tag_button.dart';
import 'package:todo/component/field.dart';
import 'package:todo/component/save_button.dart';
import 'package:todo/component/tag_chip.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    Widget space({double height = 10}) => SizedBox(height: height);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: const Text(
          "Add a Task",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space(height: 20),
            Field(
              width: 280,
              maxLength: 30,
              hint: 'Title',
              maxLine: 1,
              textEditingController: titleController,
            ),
            space(),
            Field(
              width: 280,
              maxLength: 500,
              maxLine: 12,
              hint: 'Description',
              textEditingController: descriptionController,
            ),
            space(),
            Container(
              margin: const EdgeInsets.all(20),
              width: 280,
              child: Wrap(
                children: [
                  TagChip(name: "hi"),
                  TagChip(name: "hello"),
                  TagChip(name: "hi"),
                  TagChip(name: "hello"),
                  TagChip(name: "hi"),
                  AddTagButton(onPressed: (){}),
                ],
              ),
            ),
            space(height: 20),
            SaveButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
