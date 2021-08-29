import 'package:flutter/material.dart';
import 'package:todo/configs/app_colors.dart';

class AlertMessage {
  final BuildContext _context;
  static AlertMessage? _instance;

  factory AlertMessage(BuildContext context) {
    _instance ??= AlertMessage._(context);
    return _instance!;
  }

  AlertMessage._(this._context);

  void info(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(_context).textTheme.subtitle1,
        ),
      ),
    );
  }

  void warning(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.warningColor,
        content: Text(
          message,
          style: Theme.of(_context)
              .textTheme
              .subtitle1
              !.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void error(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.errorColor,
        content: Text(
          message,
          style: Theme.of(_context)
              .textTheme
              .subtitle1
              !.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
