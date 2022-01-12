import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo/Classes/colors.dart';
import 'package:todo/Classes/logic.dart';
import 'package:todo/Classes/style.dart';
import 'package:todo/Classes/texts.dart';
import 'package:todo/Datas/task_data.dart';

class AddTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTaskState();
  }
}

class AddTaskState extends State<AddTask> {

  double h ;
  double w;
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return WillPopScope(child: Scaffold(
      appBar: appBar(),
      body: body(),
    ), onWillPop: () => Future(() => false));
  }
  Widget appBar(){
    return AppBar(backgroundColor: ColorClass.blueColor,
        automaticallyImplyLeading: false,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Row(children: [
                InkWell(
                  child: Icon(Icons.transit_enterexit,size: 40,),
                  onTap: (){
                   Navigator.pop(context);
                  },
                ),],),
            ])
    );
  }
  Widget body(){
    return   Center(
      child: background(),
    );
  }
  Widget background(){
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
          color: ColorClass.milky
      ),

    );
  }

}