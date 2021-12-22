import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/home_page/home_page_bloc.dart';
import 'package:todo/views/add_todo_page.dart';
import 'package:todo/views/widgets/filter_options_bottom_sheet.dart';
import 'package:todo/views/widgets/todo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final bloc = BlocProvider.of<HomePageBloc>(context);
              if (bloc.state is HomePageSuccess) {
                filterOptionsBottomSheet(context, bloc);
              }
            },
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomePageSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Remaining Todos',
                        style: TextStyle(fontSize: 17),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text(
                          '${state.remainedTodos}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReorderableListView(
                    children: state.todos
                        .map(
                          (todo) => TodoCard(
                            todo: todo,
                            key: UniqueKey(),
                            onTodoPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTodoPage(
                                    todo: todo,
                                  ),
                                ),
                              );
                              context
                                  .read<HomePageBloc>()
                                  .add(const HomePageGotbackFromAddTodoPage());
                            },
                            onCheckButtonPressed: (_) {
                              context
                                  .read<HomePageBloc>()
                                  .add(HomePageCheckButtonPressed(todo));
                            },
                            onDeleteButtonPressed: () {
                              context
                                  .read<HomePageBloc>()
                                  .add(HomePageDeleteButtonPressed(todo));
                            },
                          ),
                        )
                        .toList(),
                    onReorder: (oldIndex, newIndex) {
                      context.read<HomePageBloc>().add(
                            HomePageTodoReordered(oldIndex, newIndex),
                          );
                    },
                  ),
                ),
              ],
            );
          } else if (state is HomePageEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Text(
                  'You havent added any todo yet.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Something went horribly wrong!!. Contact our support team for more info.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
          context
              .read<HomePageBloc>()
              .add(const HomePageGotbackFromAddTodoPage());
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
