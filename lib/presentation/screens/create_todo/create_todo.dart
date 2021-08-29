import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/configs/sizes/index.dart';
import 'package:todo/configs/strings.dart';
import 'package:todo/data/providers/storage/database/entity/todo_entity.dart';
import 'package:todo/presentation/state_notifiers/home/index.dart';
import 'package:todo/presentation/widgets/appbar/main_app_bar.dart';
import 'package:todo/routes.dart';

class CreateToDoScreen extends ConsumerStatefulWidget {
  const CreateToDoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateToDoScreenState();
}

class _CreateToDoScreenState extends ConsumerState<CreateToDoScreen> {
  late final TextEditingController _titleController = TextEditingController();
  late final TextEditingController _descriptionController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        context,
        title: Strings.createNewTodo,
      ),
      body: _buildForm(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(LayoutSizes(context).marginL),
      child: FloatingActionButton(
        child: Icon(Icons.check,color: Theme.of(context).iconTheme.color,),
        onPressed: () {
          if (!_formKey.currentState!.validate()) return;
          ref.watch(homeStateNotifierProvider.notifier).saveToDoItem(
              entity: ToDoEntity(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dateTime: DateTime.now().toString(),
                  tagId: '1'));
          AppNavigator.replaceWith(NavigationPaths.home);
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(LayoutSizes(context).marginM),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: Strings.title,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return Strings.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(LayoutSizes(context).marginM),
            child: TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: Strings.description,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return Strings.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
