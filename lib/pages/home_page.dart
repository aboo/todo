import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/add_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TodoApp",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddItemPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
