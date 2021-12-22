import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/db/database.dart';
import 'package:todo/views/home_page.dart';

import 'application/home_page/home_page_bloc.dart';
import 'core/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  await getIt<DataBase>().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            getIt<HomePageBloc>()..add(const HomePageInitialized()),
        child: const HomePage(),
      ),
    );
  }
}
