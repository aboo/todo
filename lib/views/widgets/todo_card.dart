import 'package:flutter/material.dart';
import 'package:todo/domain/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    required this.todo,
    required this.onTodoPressed,
    required this.onCheckButtonPressed,
    required this.onDeleteButtonPressed,
    required UniqueKey key,
  }) : super(key: key);

  final Todo todo;
  final ValueChanged<bool?> onCheckButtonPressed;
  final VoidCallback onTodoPressed;
  final VoidCallback onDeleteButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: onTodoPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(60),
            child: Row(
              children: [
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: onCheckButtonPressed,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          todo.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onDeleteButtonPressed,
                  icon: const Icon(Icons.delete),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.menu),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
