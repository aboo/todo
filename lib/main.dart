import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/base/routes.dart';
import 'package:todo/screens/detail.dart';
import 'package:todo/screens/home.dart';
import 'package:velocity_x/velocity_x.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  updateStatusBar();
  Vx.setPathUrlStrategy();
  try {
    await Firebase.initializeApp();
  } catch (Exception) {
    print("not install firebase $Exception");
  }
  runApp(TodoApp());
}

void updateStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class TodoApp extends StatelessWidget {
   TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // title: 'To Do',
      onGenerateTitle: (BuildContext context) =>
      AppLocalizations.of(context)!.title,
      useInheritedMediaQuery: true,
      routerDelegate: navigator,
      routeInformationParser: VxInformationParser(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }

  final navigator = VxNavigator(
    notFoundPage: (uri, params) => MaterialPage(
      key: const ValueKey('not-found-page'),
      child: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Page ${uri.path} not found'),
          ),
        ),
      ),
    ),
    routes: {
      '/': (_, __) => MaterialPage(child: Home()),
      Routes.newTask: (_, params) => MaterialPage(child: const Detail(), arguments: params),
      Routes.detail: (_, params) =>  MaterialPage(child: const Detail(), arguments: params),
    },
  );
}
