import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/services/navigator_service.dart';
import 'package:todo/viewModels/todo_view_model.dart';
import 'package:todo/widgets/app_bar_widget.dart';

class TodoScreen extends StatefulWidget {
  static const String id = "TodoScreen";
  final TodoViewModel todoViewModel;

  TodoScreen({this.todoViewModel});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool addingNewTag = false;

  TodoViewModel _todoViewModel;
  TextEditingController textEditingControllerTitle = TextEditingController();
  TextEditingController textEditingControllerDescription =
      TextEditingController();
  bool newStatus;

  @override
  void initState() {
    super.initState();

    _todoViewModel =
        context.read<TodoProvider>().getTaskById(widget.todoViewModel.id);

    textEditingControllerTitle.text = _todoViewModel.title;
    textEditingControllerDescription.text = _todoViewModel.description;
    newStatus = _todoViewModel.finished;

    textEditingControllerTitle.addListener(() {
      _todoViewModel.title = textEditingControllerTitle.text;
    });
    textEditingControllerDescription.addListener(() {
      _todoViewModel.description = textEditingControllerDescription.text;
    });
  }

  Widget _newTaskWidget() {
    String newTagTitle;

    if (addingNewTag) {
      return Material(
        elevation: 1,
        child: Container(
          color: Colors.grey.shade300,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (newValue) {
                    newTagTitle = newValue;
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  if (newTagTitle == null || newTagTitle.isEmpty) return;
                  _todoViewModel.tags.add(newTagTitle);
                  setState(() {
                    addingNewTag = false;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 0,
    );
  }

  Widget _addTagButton() {
    if (addingNewTag) return Container();

    return FloatingActionButton(
      onPressed: () {
        setState(() {
          addingNewTag = true;
        });
      },
      child: Icon(Icons.add),
    );
  }

  Widget _tagWidget(String tag) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _todoViewModel.tags.removeWhere((element) => element == tag);
            });
          },
        ),
        Text(tag),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: _todoViewModel.title,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Text("Title: "),
                ),
                controller: textEditingControllerTitle,
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Text("Description: "),
                ),
                controller: textEditingControllerDescription,
              ),
              Row(
                children: [
                  Text("Status: "),
                  Checkbox(
                    value: newStatus,
                    onChanged: (_newStatus) {
                      setState(() {
                        newStatus = _newStatus;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text("Tags :"),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(8.0),
                  itemBuilder: (context, index) =>
                      _tagWidget(_todoViewModel.tags[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                  itemCount: _todoViewModel.tags?.length ?? 0,
                ),
              ),
              Container(
                height: kToolbarHeight,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<TodoProvider>().updateTask(_todoViewModel);
                        context.read<TodoProvider>().saveData(context);
                        NavigationService(context).pop();
                      },
                      child: Text("Save"),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        NavigationService(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _addTagButton(),
      bottomSheet: _newTaskWidget(),
    );
  }
}
