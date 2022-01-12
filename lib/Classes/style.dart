import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class StyleClass{
  static const String textFontFamily = 'Iransans';
  static const double textHeaderSize = 35;
  static const double textSubHeaderSize = 20;
  static const double textSize = 16;

  loading(type){
    if(type == 'show'){
      EasyLoading.show(status: '', dismissOnTap: false);
    }else if(type == 'cancel'){
      EasyLoading.dismiss();
    }

  }
}