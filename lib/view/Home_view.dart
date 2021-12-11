import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/provider.dart';
import 'package:reorderables/reorderables.dart';
import 'package:todo/view/add_task_view.dart';

class HomeView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int pendingTask = 0;
  int countPendingTask(box) {
    int count = 0;
    for (var item in box.values) {
      if (!item.status) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final _box = ref.watch(tasksBoxProvider);
    final controller = ref.watch(homeController);
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: _box.listenable(),
            builder: (BuildContext context, Box<Task> box, Widget? child) {
              return Text('${countPendingTask(box).toString()} pending Task');
            }),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, widget) {
          return ValueListenableBuilder(
            valueListenable: _box.listenable(),
            builder: (BuildContext context, Box<Task> box, Widget? child) {
              List<Task> tasks = box.values.toList();

              return ReorderableColumn(
                onReorder: (oldIndex, newIndex) {
                  List<Task> _list = tasks;
                  setState(() {
                    var item = _list.removeAt(oldIndex);
                    _list.insert(newIndex, item);
                    Iterable<Task> newList = _list;
                    box.clear().then((value) => box.addAll(newList));
                  });
                },
                children: List.generate(tasks.length, (index) {
                  var task = tasks[index];
                  return ListTile(
                    key: ValueKey(index),
                    leading: Checkbox(
                        value: task.status,
                        onChanged: (value) {
                          setState(() {
                            box.putAt(index, task..status = !task.status);
                          });
                        }),
                    title: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              task.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  decoration: task.status
                                      ? TextDecoration.lineThrough
                                      : null),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.description,
                            style: TextStyle(
                                decoration: task.status
                                    ? TextDecoration.lineThrough
                                    : null)),
                        SizedBox(
                          height: 5,
                        ),
                        Wrap(
                            children: List.generate(
                                task.tags.length,
                                (i) => Container(
                                      padding: const EdgeInsets.all(2),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                        task.tags[i],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )))
                      ],
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

