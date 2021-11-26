import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/base/routes.dart';
import 'package:todo/data/provider.dart';
import 'package:todo/data/repository.dart';
import 'package:todo/data/task.dart';
import 'package:velocity_x/velocity_x.dart';
import '../base/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AppLocalizations? localizations;
  late Provider provider;
  final DataRepository repository = DataRepository();

  @override
  void initState() {
    super.initState();
    provider = Provider();
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StreamBuilder<QuerySnapshot>(
            stream: repository.tasks(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        //ToDo filtering
                        // DropdownButton(items: items),
                        item(
                            snapshot.requireData.docs[index].data() as Task,
                            snapshot.requireData.docs[index].reference.id,
                            index)
                      ],
                    );
                  },
                  itemCount: snapshot.requireData.docs.length,
                );
              }
              return const LinearProgressIndicator();
            }),
      ),
      floatingActionButton: floatingButton(),
    );
  }

  AppBar appBar(){
    return AppBar(
      title: Text(localizations!.title),
      actions: [
        badge(),
      ],
    );
  }

  Widget badge(){
    return Center(
      child: StreamBuilder(
        stream: repository.notDoneTasks(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(snapshot.requireData.docs.length.toString()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget item(Task task, String referenceId, int order) {
    task.referenceId = referenceId;
    debugPrint('data ${task.toJson()}');
    task.order = order;
    return GestureDetector(
      onTap: () {
        provider.onItemClick(task);
        VxNavigator.of(context)
            .push(Uri(path: Routes.detail), params: provider);
      },
      child: Card(
        key: ValueKey(order),
        elevation: task.isDone ? 0: 2,
        child: ListTile(
          tileColor: AppColors.box,
          title: Text(task.title),
          trailing: IconButton(
            onPressed: () {
              repository.deleteTask(task);
            },
            icon: const Icon(
              Icons.delete,
              size: 30,
            ),
          ),
          leading: Checkbox(
            onChanged: (bool? value) {
              // setState(() => task.isDone = !task.isDone);
              task.isDone = !task.isDone;
              repository.onDoneChanged(task);
            },
            value: task.isDone,
          ),
        ),
      ),
    );
  }

  Widget floatingButton(){
    return FloatingActionButton(
      onPressed: () => VxNavigator.of(context)
          .push(Uri(path: Routes.newTask), params: provider),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
