import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/data/provider.dart';
import 'package:todo/data/repository.dart';
import 'package:todo/data/task.dart';
import 'package:velocity_x/velocity_x.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late AppLocalizations? localizations;
  late Provider provider;
  late TextEditingController titleController;
  late TextEditingController descController;
  late DataRepository repository;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descController = TextEditingController();
    repository = DataRepository();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    provider = ModalRoute.of(context)!.settings.arguments as Provider;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: body(),
      ),
    );
  }

  AppBar appBar(){
    return AppBar(
      title: Text(localizations!.detail),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: StreamBuilder(
              stream: provider.selectedTask,
              builder: (_, AsyncSnapshot<Task?> snapshot) {
                return IconButton(
                  onPressed: () {
                    if (snapshot.hasData) {
                      if (titleController.text.isNotEmpty) {
                        snapshot.requireData!.title = titleController.text;
                      }
                      snapshot.requireData!.description = descController.text;
                      repository.onDoneChanged(snapshot.requireData!);
                    } else {
                      repository.addTask(Task(
                        id: DateTime.now().toString(),
                        title: titleController.text,
                        description: descController.text,
                      ));
                    }
                    VxNavigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 30,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget body(){
    return StreamBuilder(
      stream: provider.selectedTask,
      builder: (_, AsyncSnapshot<Task?> snapshot) {
        if (snapshot.hasData) {
          titleController.text = snapshot.requireData!.title;
          descController.text = snapshot.requireData!.description ?? '';
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
          child: Column(
            children: [
              TextField(
                controller: titleController,
              ),
              TextField(
                controller: descController,
              ),
            ],
          ),
        );
      },
    );
  }
}
