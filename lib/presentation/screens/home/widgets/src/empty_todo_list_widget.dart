import 'package:flutter/material.dart';
import 'package:todo/configs/strings.dart';

class EmptyToDoListWidget extends StatelessWidget {
  const EmptyToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Strings.todoListIsEmpty,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
