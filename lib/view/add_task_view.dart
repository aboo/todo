import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/provider.dart';

class AddTaskView extends ConsumerWidget {
  AddTaskView({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final box = ref.watch(tasksBoxProvider);
    final controller = ref.watch(addTaskController);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                label: Text('description'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled:
                          true, // required for min/max child size
                      context: context,
                      builder: (ctx) {
                        return MultiSelectBottomSheet(
                          items: tagList
                              .map((e) => MultiSelectItem<String>(e, e))
                              .toList(),
                          initialValue: controller.tags,
                          onConfirm: (List<String> values) {
                            controller.addTags(values);
                          },
                          maxChildSize: 0.8,
                        );
                      },
                    );
                  },
                  child: Row(children: const [
                    Icon(Icons.label),
                    Text(' select tags'),
                  ]),
                ),
              ],
            ),
            MultiSelectChipDisplay(
              items: controller.tags.map((e) => MultiSelectItem(e, e)).toList(),
              onTap: (value) {
                controller.removeTag(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                box.add(Task(titleController.text, descriptionController.text,
                    controller.tags, false));
                Navigator.pop(context);
              },
              child: const Text('All Task'),
            )
          ],
        )),
      ),
    );
  }
}
List<String> tagList = ['work', 'school', 'project', 'home', 'shopping'];
