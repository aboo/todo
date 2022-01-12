import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo/Classes/texts.dart';
import 'package:todo/Datas/task_data.dart';
import 'package:todo/Views/addTask_View.dart';
import 'dart:math' as math;

import 'colors.dart';

class LogicClass{
  goTo({@required name, @required context,serviceData}) async {
    if(name=='AddTask'){
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Directionality(textDirection: TextDirection.rtl, child:AddTask())),);
    }
  }

  toast(text){
    showToast(text,backgroundColor: ColorClass.blueColor);
  }

  dialogBox(context,message){
    Alert(
      context: context,
      type: AlertType.info,
      title: message,
      buttons: [
        DialogButton(
          child: Text(
            TextClass.addTask,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: () => goTo(name: "AddTask",context: context),
          color: ColorClass.blueColor,
        )
      ],
    ).show();
  }

}