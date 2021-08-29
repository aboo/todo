import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';
import 'package:todo/presentation/state_notifiers/home/index.dart';

class ToDoItem extends ConsumerWidget {
  final ToDoEntity entity;

  const ToDoItem({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: InkWell(
        onTap: () => ref
            .watch(homeStateNotifierProvider.notifier)
            .deleteToDoItem(id: entity.id!),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
        ),
      ),
      title: Text(
        entity.title,
        style: Theme.of(context).textTheme.headline4,
      ),
      subtitle: Text(
        entity.description,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      trailing: Icon(Icons.drag_indicator),
    );
  }
}
