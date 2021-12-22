import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/home_page/home_page_bloc.dart';
import 'package:todo/domain/tag.dart';

void filterOptionsBottomSheet(BuildContext context, HomePageBloc bloc) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => CheckBoxListPicker(bloc: bloc),
  );
}

class CheckBoxListPicker extends StatefulWidget {
  final HomePageBloc bloc;
  const CheckBoxListPicker({required this.bloc, Key? key}) : super(key: key);

  @override
  _CheckBoxListPickerState createState() => _CheckBoxListPickerState();
}

class _CheckBoxListPickerState extends State<CheckBoxListPicker> {
  late bool showRemainedTodos;
  late HomePageSuccess currentState;
  late List<Tag> selectedtags;

  @override
  void initState() {
    currentState = widget.bloc.state as HomePageSuccess;
    showRemainedTodos = currentState.showRemainedTodos;
    selectedtags = currentState.selectedTags;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return Container(
          height: 350,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.bloc.add(HomePageFiltersChanged(
                      showRemainedTodos,
                      selectedtags.toList(),
                    ));
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 15, bottom: 10),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Only show remaining todos',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Switch(
                        value: showRemainedTodos,
                        onChanged: (value) {
                          showRemainedTodos = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              child: Text(
                                'Filter by tag',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: currentState.tags.length,
                            itemBuilder: (context, index) => CheckboxListTile(
                              title: Text(currentState.tags[index].name),
                              value: selectedtags
                                  .contains(currentState.tags[index]),
                              onChanged: (newValue) {
                                if (!selectedtags
                                    .contains(currentState.tags[index])) {
                                  selectedtags.add(currentState.tags[index]);
                                } else {
                                  selectedtags.remove(currentState.tags[index]);
                                }
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
