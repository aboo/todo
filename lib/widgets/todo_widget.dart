
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/models/todo_item.dart';
import 'package:todo/my_theme.dart';
import 'package:todo/viewmodel/todo_viewmodel.dart';

class TodoWidget{

  static Widget entityItem({required TodoItem todoItem,required BuildContext context}){
    return Container(
      color: Colors.white,
      height: 120,
      child: Column(children: [
        Row(children: [

          Padding(
            padding: const EdgeInsets.only(right: 20,top: 11,bottom: 11,left: 13),
            child: _whichIcon(todoItem: todoItem),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(todoItem.title,style: MyTheme.t_700_16_black,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(todoItem.description,style: MyTheme.t_700_16_black,),
              ),


            ],)),
          Column(
            children: [
              IconButton(onPressed: () {
                Provider.of<TodoViewModel>(context, listen: false).deleteTask(todoItem: todoItem);
              }, icon: Icon(Icons.delete,color: MyTheme.red,)),

              IconButton(onPressed: () {
                Provider.of<TodoViewModel>(context, listen: false).doneTask(todoItem: todoItem);
              }, icon: Icon(Icons.done,color:todoItem.status=="Done"? MyTheme.green : MyTheme.red,)),

            ],
          )

        ],),
        Padding(
          padding:  EdgeInsets.only(top: 8,),
          child: Divider(height: 0.5,color: MyTheme.gray3c29,thickness: 0.5,),
        )
      ],),
    );
  }

 static _whichIcon({required TodoItem todoItem}){

    if(todoItem.status=="Pending"){
      return Container(width:60,height: 60 ,child: Icon(Icons.check,color: MyTheme.white,size: 30),decoration: BoxDecoration(shape: BoxShape.circle,color: MyTheme.blue),);
    }else if(todoItem.status=="Deleted"){
      return Container(width:60,height: 60 ,child: Icon(Icons.delete_forever_outlined,color: MyTheme.white,size: 30),decoration: BoxDecoration(shape: BoxShape.circle,color: MyTheme.red),);
    }else if(todoItem.status=="Done"){
      return Container(width:60,height: 60 ,child: Icon(Icons.check,color: MyTheme.white,size: 30),decoration: BoxDecoration(shape: BoxShape.circle,color: MyTheme.green),);
    }

  }

}