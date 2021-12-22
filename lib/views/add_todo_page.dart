import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/bloc/add_todo_bloc.dart';
import 'package:todo/core/get_it.dart';
import 'package:todo/domain/todo.dart';
import 'package:todo/views/widgets/add_tag_widget.dart';
import 'package:todo/views/widgets/rounded_text_field.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({Key? key, this.todo}) : super(key: key);

  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddTodoBloc>(param1: todo),
      child: BlocConsumer<AddTodoBloc, AddTodoState>(
        listener: (context, state) {
          if (state.shouldNavigateToHomePage) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) => Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(
                        controller: state.titleController,
                        label: 'Title',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedTextField(
                        controller: state.descriptionController,
                        label: 'Description',
                        minLines: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AddTagWidget(),
                      Wrap(
                        children: state.tags
                            .map((tag) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Chip(label: Text(tag.name)),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            context
                                .read<AddTodoBloc>()
                                .add(const AddTodoSaveButtonPressed());
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
