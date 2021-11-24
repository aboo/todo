import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/component/tag_chip.dart';
import 'package:todo/providers/todo_provider.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key key}) : super(key: key);

  Widget checkBoxWithTitle(
      String title, void Function(bool) onChange, bool value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: value, onChanged: onChange),
        const SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: false,
        title: const Text(
          "Filter",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checkBoxWithTitle(
              "Completed Task",
              todoProvider.updateFilterByCompleteTag,
              todoProvider.filterByCompleteItem),
          const SizedBox(
            height: 5,
          ),
          checkBoxWithTitle(
              "Pending Task",
              todoProvider.updateFilterByPendingTag,
              todoProvider.filterByPendingItem),
          const SizedBox(
            height: 20,
          ),
          checkBoxWithTitle("AllTags", todoProvider.updateDisableTagFilter,
              todoProvider.disableTagFiler),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(
              todoProvider.tags.length,
              (index) => TextButton(
                onPressed: () {
                  String tag = todoProvider.tags[index];
                  if (!todoProvider.selectedTags.contains(tag)) {
                    todoProvider.addTagToFilter(tag);
                  } else {
                    todoProvider.removeTagInFilter(tag);
                  }
                },
                child: TagChip(
                  name: todoProvider.tags[index],
                  backgroundColor: todoProvider.selectedTags
                          .contains(todoProvider.tags[index])
                      ? const Color(0xD286CBFF)
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
