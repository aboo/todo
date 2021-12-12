import 'package:flutter/material.dart';
import 'package:todo/widgets/tag_widget.dart';

class NewTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        actions: [
          InkWell(
            radius: 50,
            onTap: () {},
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("SAVE"),
            )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: "Title")),
            SizedBox(height: 16),
            TextField(
                maxLines: 4, decoration: InputDecoration(hintText: "detail")),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text("Mark as done"),
              value: true,
              onChanged: (newValue) {},
              contentPadding: EdgeInsets.zero,
            ),
            Row(
              children: [
                TextField(
                    decoration: InputDecoration(
                        hintText: "endter your tag and prest submit")),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: ["tag1"]
                  .map((e) => TagWidget(
                        title: e,
                        onTap: () {},
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
