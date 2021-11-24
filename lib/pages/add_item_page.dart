import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/component/add_tag_button.dart';
import 'package:todo/component/add_tag_dialog.dart';
import 'package:todo/component/field.dart';
import 'package:todo/component/save_button.dart';
import 'package:todo/component/tag_chip.dart';
import 'package:todo/data_models/todo.dart';
import 'package:todo/my_bloc/tag_bloc.dart';
import 'package:todo/sql_service/sql_services.dart';

class AddItemPage extends StatelessWidget {

  const AddItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TagBlocCubit tagBlocCubit = TagBlocCubit(TagBlocState(tags: []));
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    Widget space({double height = 10}) => SizedBox(height: height);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: const Text(
          "Add a Task",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space(height: 20),
            Field(
              width: 280,
              maxLength: 30,
              hint: 'Title',
              maxLine: 1,
              textEditingController: titleController,
            ),
            space(),
            Field(
              width: 280,
              maxLength: 500,
              maxLine: 12,
              hint: 'Description',
              textEditingController: descriptionController,
            ),
            space(),
            Container(
              margin: const EdgeInsets.all(20),
              width: 280,
              child: BlocBuilder<TagBlocCubit, TagBlocState>(
                  bloc: tagBlocCubit,
                  builder: (context, TagBlocState state) {
                    List<Widget> tagWidgets = [];
                    for (String element in state.tags) {
                      tagWidgets.add(TagChip(name: element));
                    }
                    tagWidgets.add(
                      AddTagButton(
                        onPressed: () async{
                          dynamic tag = await showAddTagDialog(context);
                          if(tag is String){
                            if(tag.isNotEmpty){
                              tagBlocCubit.add(tag);
                            }
                          }
                        },
                      ),
                    );
                    return Wrap(
                      children: tagWidgets,
                    );
                  }),
            ),
            space(height: 20),
            SaveButton(
              onPressed: ()async{
                if(titleController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill the title field")));
                }else if(descriptionController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill the description field")));
                }else{
                  DateTime now = DateTime.now();
                  //id dos not import to db we set id AUTO INCREMENT
                  Todo insertTodo = Todo(id: 0, title: titleController.text, description: descriptionController.text, tags: tagBlocCubit.state.tags, year: now.year.toString(),month: now.month.toString(),day: now.day.toString(),isComplete: 0);
                  Map<String,dynamic> insertMap = insertTodo.toInsertMap();
                  //sqlflite return id as response
                  int response = await SqLiteService.insert(insertMap);
                  insertTodo.id = response;
                  Navigator.of(context).pop(insertTodo);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
