import 'package:flutter/material.dart';

Future<dynamic> showAddTagDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      TextEditingController tagController = TextEditingController();
      return AlertDialog(
        title: const Text('Add New Tag'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                maxLength: 10,
                controller: tagController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent))),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel',style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              Navigator.of(context).pop(tagController.text);
            },
          ),
        ],
      );
    },
  );
}
