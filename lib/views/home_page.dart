import 'package:flutter/material.dart';

import 'add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Todos Here')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
