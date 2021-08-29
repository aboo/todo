import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/configs/theme/app_theme.dart';
import 'package:todo/routes.dart';

import 'configs/sizes/src/design_sizes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      initialRoute: NavigationPaths.home,
      builder: (context, child) {
        final data = MediaQuery.of(context);
        final textScaleFactor =
            data.size.width / DesignSizes.mobileScreenSize.width;

        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child!,
        );
      },
    );
  }
}
