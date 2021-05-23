import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;

  AppBarWidget({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), actions: [
      Consumer<TodoProvider>(
        builder: (context, todoProvider, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: Text(
              "task count: ${todoProvider.getTaskCount()}",
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
