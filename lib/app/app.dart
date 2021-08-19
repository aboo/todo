import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:todo/app/routes.dart';
import 'package:todo/app/shared/styles.dart';
import 'package:todo/app/todoList/pages/todo_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        localizationDelegate
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      locale: localizationDelegate.currentLocale,
      theme: appTheme,
      home: TodoPage(),
    ),
        state: LocalizationProvider.of(context).state);
  }
}
