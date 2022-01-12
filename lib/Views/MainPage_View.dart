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

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
   double h ;
   double w;
  @override
  void initState() {
    addItems();
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              LogicClass().dialogBox(context, TextClass.dialogHeader);
            },
            backgroundColor: ColorClass.blueColor,
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: appBar(),
          body: body(),
        ), onWillPop: () => Future(() => false));
  }
  Widget appBar(){
    return AppBar(backgroundColor: ColorClass.blueColor,

        title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Row(children: [
             InkWell(
               child: Icon(Icons.search,size: 40,),
               onTap: (){
                 LogicClass().toast('Search');
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
      child: todoList(),
    );
  }

  Widget todoList(){
    var finalServices = [];
     List<bool> isChecked;
    List<dynamic> servicesList = [];
    return Consumer<TaskData>(builder: (context,taskData, child) {
      print(taskData.tasks.length);
      return ListView(children: taskData.tasks.map((task) =>
          InkWell(onTap:() {
            // stopData.unselectAll();
          }
          ,child: Padding(padding: EdgeInsets.only(top: 20),child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  key: Key('${taskData.tasks.indexOf(task)}'),
                  child:Container(
                    decoration: const BoxDecoration(
                        color: ColorClass.whiteColor,
                        borderRadius: BorderRadius.all( Radius.circular(15))
                    ),
                    width: w,
                    height: 80,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(value: false,

                            activeColor: ColorClass.blueColor,
                            onChanged:(bool newValue){
                              setState(() {

                              });
                              Text('Remember me');
                            }),
                        Padding(padding: EdgeInsets.only(right: 20),child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Padding(padding: EdgeInsets.only(top: 10,bottom: 10),child: Text(task.name.toString(),textAlign: TextAlign.start,style:TextStyle(color: ColorClass.blueColor),),),
                            Padding(padding: EdgeInsets.only(bottom: 10),child:  Text(task.date.toString(),textAlign: TextAlign.start,style:TextStyle(color: ColorClass.blueColor),),)
                        ],),),

                      ],),

                  )
              ),))).toList(),

      );
    },);
  }

  addItems(){
    Provider.of<TaskData>(context, listen: false).clearList();
    Provider.of<TaskData>(context, listen: false).addTask(itemIndex: 94327569,name: "task 1",date: "wed,jan 19, 2022");
    Provider.of<TaskData>(context, listen: false).addTask(itemIndex: 34534543,name: "task 2",date: "wed,jan 20, 2022");
    Provider.of<TaskData>(context, listen: false).addTask(itemIndex: 67657775,name: "task 3",date: "wed,jan 21, 2022");
    Provider.of<TaskData>(context, listen: false).addTask(itemIndex: 87875554,name: "task 4",date: "wed,jan 22, 2022");
    Provider.of<TaskData>(context, listen: false).addTask(itemIndex: 22345564,name: "task 5",date: "wed,jan 23, 2022");
  }
}