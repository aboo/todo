import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/screens/todo_screen.dart';
import 'package:todo/services/navigator_service.dart';
import 'package:todo/viewModels/todo_view_model.dart';

class TodoCardWidget extends StatelessWidget {
  final TodoViewModel todoViewModel;

  TodoCardWidget({this.todoViewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService(context).push(
          TodoScreen(
            todoViewModel: todoViewModel,
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: todoViewModel.finished,
                  onChanged: (newStatus) {
                    context.read<TodoProvider>().finishUpTask(
                          todoViewModel: todoViewModel,
                          newStatus: newStatus,
                        );
                    context.read<TodoProvider>().saveData(context);
                  },
                ),
                Text(todoViewModel.title)
              ],
            ),
            Text(todoViewModel.description ?? ""),
          ],
        ),
      ),
    );
  }
}
