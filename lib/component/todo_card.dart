import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/component/tag_chip.dart';
import 'package:todo/data_models/todo.dart';
import 'package:todo/providers/todo_provider.dart';


class TodoCard extends StatelessWidget {
  final Todo todo;
  final TodoProvider todoProvider;
  const TodoCard({Key key, @required this.todo,@required this.todoProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color(0xffe0e0e0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(value: todo.isComplete == 0?false:true, onChanged: (val){
                todoProvider.updateCheckTask(val, todo.id);
              }),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    todo.description,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Wrap(
                    children: List.generate(
                      todo.tags.length,
                      (index) => TagChip(
                        name: '#' + todo.tags[index],
                        backgroundColor: Colors.cyan,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'created in '+todo.year+'/'+todo.month+'/'+todo.day,
                    style: const TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,color: Colors.black38),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
