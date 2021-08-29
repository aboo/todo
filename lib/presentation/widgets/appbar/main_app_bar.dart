import 'package:flutter/material.dart';
import 'package:todo/configs/sizes/index.dart';
import 'package:todo/routes.dart';

class MainAppBar extends AppBar {
  MainAppBar(BuildContext context,
      {String? title, IconData? rightIcon, VoidCallback? onBackButtonPressed})
      : super(
          title: title != null ? Text(title) : null,
          leading: IconButton(
            onPressed: () {
              if (onBackButtonPressed != null) {
                onBackButtonPressed.call();
              } else {
                AppNavigator.pop();
              }
            },
            icon: const Icon(Icons.arrow_back),
            padding:
                EdgeInsets.symmetric(horizontal: LayoutSizes(context).paddingM),
          ),
          actions: [
            if (rightIcon != null)
              Padding(
                padding: EdgeInsets.only(right: LayoutSizes(context).paddingM),
                child: Icon(rightIcon),
              )
          ],
        );
}
