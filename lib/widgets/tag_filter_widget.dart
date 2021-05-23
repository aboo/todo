import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';

class TagFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _tagWidget(String tag, bool isSelected) {
      return InkWell(
        onTap: () {
          context.read<TodoProvider>().onClickTagFilter(tag);
        },
        child: Card(
          elevation: 10,
          color: isSelected ? Colors.blue : Colors.white,
          child: Text(tag),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          var allTags = todoProvider.getAllTags();
          var selectedTags = todoProvider.listFilterTags;

          if (allTags.isEmpty) return Container();

          return Row(
            children: allTags
                .map(
                  (tag) => _tagWidget(
                    tag,
                    selectedTags.any((element) => tag == element),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
