import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:todo/app/app.dart';

void main() async{
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US' ,supportedLocales: ['en_US','fa']);

  runApp(
    LocalizedApp(delegate, MyApp()),
  );
}
