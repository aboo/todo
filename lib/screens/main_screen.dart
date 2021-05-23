import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/services/shared_preferences_service.dart';
import 'package:todo/widgets/app_bar_widget.dart';
import 'package:todo/widgets/status_filter_widget.dart';
import 'package:todo/widgets/tag_filter_widget.dart';
import 'package:todo/widgets/todo_card_widget.dart';

class MainScreen extends StatefulWidget {
  static const String id = "/";

  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool addingNewTask = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesService(context).getData().then((data) {
      context.read<TodoProvider>().init(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Todo List",
      ),
      body: SafeArea(
        child: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) => Column(
            children: [
              TagFilterWidget(),
              StatusFilterWidget(),
              Expanded(
                child: ListView.separated(
                  itemCount: todoProvider.listItems?.length ?? 0,
                  itemBuilder: (context, index) => TodoCardWidget(
                    todoViewModel: todoProvider.listItems[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _newTaskWidget(),
      floatingActionButton: _addNewTaskButton(),
    );
  }

  Widget _newTaskWidget() {
    String newTaskTitle;

    if (addingNewTask) {
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
                    newTaskTitle = newValue;
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  print(newTaskTitle);
                  if (newTaskTitle == null || newTaskTitle.isEmpty) return;
                  context.read<TodoProvider>().setNewTask(title: newTaskTitle);
                  context.read<TodoProvider>().saveData(context);
                  setState(() {
                    addingNewTask = false;
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

  Widget _addNewTaskButton() {
    if (addingNewTask) return Container();

    return FloatingActionButton(
      onPressed: () {
        setState(() {
          addingNewTask = true;
        });
      },
      child: Icon(Icons.add),
    );
  }
}
