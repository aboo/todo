import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/configs/sizes/index.dart';
import 'package:todo/configs/strings.dart';
import 'package:todo/presentation/screens/home/widgets/index.dart';
import 'package:todo/presentation/state_notifiers/home/index.dart';
import 'package:todo/presentation/widgets/appbar/main_app_bar.dart';
import 'package:todo/presentation/widgets/error/custom_error_widget.dart';
import 'package:todo/presentation/widgets/progress/progress.dart';
import 'package:todo/routes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeConsumerState();
}

class _HomeConsumerState extends ConsumerState<HomeScreen> {
  final int _limit = 10;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ref
          .watch(homeStateNotifierProvider.notifier)
          .getAllToDoList(limit: _limit, offset: _offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _homeState = ref.watch(homeStateNotifierProvider);
    return Scaffold(
      appBar: MainAppBar(
        context,
        title: Strings.todoList,
        rightIcon: Icons.filter_list_outlined,
      ),
      body: _homeState.map(
          initial: (_) => LoadingShimmer(),
          loading: (_) => CircularProgress(),
          error: (state) => CustomErrorWidget(
              message: state.message,
              tryAgain: () => ref
                  .watch(homeStateNotifierProvider.notifier)
                  .getAllToDoList()),
          data: (state) => state.data.isEmpty
              ? EmptyToDoListWidget()
              : TodoListWidget(data: state.data)),
      bottomNavigationBar: _buildBottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        AppNavigator.push(NavigationPaths.createToDo);
      },
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: LayoutSizes(context).bottomAppBarHeight,
        color: Theme.of(context).bottomAppBarColor,
      ),
    );
  }
}
