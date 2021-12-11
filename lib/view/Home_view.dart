import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/provider.dart';
import 'package:reorderables/reorderables.dart';
import 'package:todo/view/add_task_view.dart';
import 'package:todo/view/edit_task_view.dart';

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
      key: _scaffoldKey,drawer: DrawerCustom(),
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

              if (controller.filter == 'all') {
                tasks = box.values.toList();
              } else if (controller.filter == 'done') {
                tasks = tasks.where((i) => i.status).toList();
              } else if (controller.filter == 'pending') {
                tasks = tasks.where((i) => !i.status).toList();
              } else {
                tasks = tasks
                    .where((i) => i.tags.contains(controller.filter))
                    .toList();
              }

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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditTaskView(taskIndex: index)),
                        );
                      },
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
                    trailing: IconButton(
                        onPressed: () {
                          box.deleteAt(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[400],
                        )),
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

class DrawerCustom extends ConsumerWidget {
  const DrawerCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeController);
    return Drawer(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 40,
              child: const Center(
                child: Text(
                  'Filter',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Column(
              children: List.generate(
                  filters.length,
                  (i) => Expanded(
                          child: GestureDetector(
                        onTap: () {
                          controller.setFilter(filters[i]);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          color: controller.filter == filters[i]
                              ? Colors.red[300]
                              : Colors.grey[300],
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              filters[i],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ))),
            ))
          ],
        ),
      ),
    ));
  }
}



List<String> tagList = ['work', 'school', 'project', 'home', 'shopping'];

List<String> filters = ['all', 'done', 'pending', ...tagList];
