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

class EditItemPage extends StatelessWidget {
  final Todo todo;
  const EditItemPage({Key key,@required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TagBlocCubit tagBlocCubit = TagBlocCubit(TagBlocState(tags: todo.tags));
    TextEditingController titleController = TextEditingController(text: todo.title);
    TextEditingController descriptionController = TextEditingController(text: todo.description);
    Widget space({double height = 10}) => SizedBox(height: height);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: const Text(
          "Edit Task",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Field(
            width: 280,
            maxLength: 30,
            hint: 'Title',
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
                Todo updatedTodo = Todo(id: todo.id, title: titleController.text, description: descriptionController.text, tags: tagBlocCubit.state.tags, year: todo.year,month: todo.month,day: todo.day,isComplete: 0);
                Map<String,dynamic> updatedMap = updatedTodo.toInsertMap();
                SqLiteService.updateItem(updatedMap, todo.id);
                //pass the update list to home page because we should update on list
                Navigator.of(context).pop(updatedTodo);
              }
            },
          ),
        ],
      ),
    );
  }
}
