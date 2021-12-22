import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/add_todo/add_todo_bloc.dart';
import 'package:todo/views/widgets/rounded_text_field.dart';

class AddTagWidget extends StatefulWidget {
  const AddTagWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTagWidget> createState() => _AddTagWidgetState();
}

class _AddTagWidgetState extends State<AddTagWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTodoBloc, AddTodoState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RoundedTextField(
                controller: controller,
                label: 'Tags :',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  String tag = controller.text.trim().toLowerCase();
                  context.read<AddTodoBloc>().add(AddTodoTagAdded(tag));
                  controller.clear();
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
