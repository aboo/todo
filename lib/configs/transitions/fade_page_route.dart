import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder<void> {
  FadePageRoute({required Widget page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
