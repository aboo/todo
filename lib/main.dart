import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Datas/task_data.dart';
import 'Views/MainPage_View.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: WillPopScope(child:  AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Freelancer',
          theme: theme,
          builder: EasyLoading.init(),
          darkTheme: darkTheme,
          initialRoute: "/MainView",
          routes: {
            "/MainView": (context) =>    Directionality(textDirection: TextDirection.rtl, child: MainView()),

          },
          debugShowCheckedModeBanner: false,
        ),
      ), onWillPop: () => Future(() => false)),
    ) ;
  }
}
