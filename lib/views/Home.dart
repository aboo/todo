import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/my_theme.dart';
import 'package:todo/viewmodel/todo_viewmodel.dart';
import 'package:todo/widgets/todo_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }


}

class HomeState extends State<Home>{


  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController tagsController=TextEditingController();
  late double screenWidth ;
  late double screenHeigh ;
  @override
  Widget build(BuildContext context) {

     screenWidth = MediaQuery.of(context).size.width;
     screenHeigh = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: header(),
      body: Consumer<TodoViewModel>(builder: (context, todosData, child) {
        return todosData.todos.isNotEmpty ? ListView(
              children: todosData.todos.map((todo) => TodoWidget.entityItem(todoItem: todo,context: context)).toList(),
        ) : Center(child: Text("There is no todo yet...",style: MyTheme.t_m_20_black,));
      },)

    );
  }

  AppBar header(){
    return AppBar(
      actions: [
        InkWell(child: Center(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("B:D"),
        )),onTap: () {
          Provider.of<TodoViewModel>(context, listen: false).sortDeleted();

        },)
      ],
      elevation: 0,
      centerTitle: true,title:  Text("Todo List",style: MyTheme.t_700_19_white),
      leading: Center(child: IconButton(onPressed: () {
        _addContactDialog();
      }, icon: Icon(Icons.add,color: MyTheme.white,))),
      backgroundColor: MyTheme.blue,
    );
  }


  _addContactDialog() {

    titleController.clear();
    descriptionController.clear();
    tagsController.clear();

    return   showDialog(
      context: context,
      useSafeArea: true,

      builder: (context) {

        return AlertDialog(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          titlePadding: const EdgeInsets.only(top: 7,left: 7),
          backgroundColor: Colors.white,
          title: const Center(child: Padding(
            padding: EdgeInsets.only(top: 20,bottom: 14),
            child: Text("Add Todo",style: MyTheme.t_700_17_black,),
          )),
          content: SingleChildScrollView(child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        InkWell(child: const Text("Title",style:MyTheme.t_700_16_black),onTap: () {
                          // _updateProfileDialog(type: "نام");
                        },),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28),
                          child: InkWell(child: const Text("Description",style:MyTheme.t_700_16_black),onTap: () {
                            //_updateProfileDialog(type: "نام خانوادگی");
                          },),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: InkWell(child: const Text("Tags",style:MyTheme.t_700_16_black),onTap: () {
                            //_updateProfileDialog(type: "موبایل");
                          },),
                        ),

                      ],),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(width: screenWidth/3,child: TextField(controller: titleController,decoration: MyTheme.inputTextDecoration.copyWith(hintText: "Title",hintStyle: MyTheme.t_700_16_gray97))),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 28),
                            child: SizedBox(width: screenWidth/3,child: TextField(controller: descriptionController,decoration: MyTheme.inputTextDecoration.copyWith(hintText: "Description",hintStyle: MyTheme.t_700_16_gray97))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: SizedBox(width: screenWidth/3,child: TextField(maxLength: 11,controller: tagsController,keyboardType: TextInputType.text,decoration: MyTheme.inputTextDecoration.copyWith(counterText: '',fillColor: Colors.white,hintText: "tag1,tag2,tag3 ...",hintStyle: MyTheme.t_700_16_gray97))),
                          ),

                        ],),
                    )
                  ],),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: MyTheme.blue),
                          margin: const EdgeInsets.only(bottom: 0),
                          width: 127,height: 48,child:  Center(child: Text("Add",style: MyTheme.t_500_17_white,)),),onTap: () {
                          //ContactViewModel(context).addContact(name: nameController.text.toString(), family: familyController.text.toString(), mobile: phoneController.text.toString());
                          Provider.of<TodoViewModel>(context, listen: false).createTodo(title: titleController.text, description: descriptionController.text, tags: tagsController.text, status: "Pending");
                          Navigator.pop(context);

                        },),
                        InkWell(child:Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          width: 127,height: 41,child:  Center(child: Text("Cancel",style: MyTheme.t_500_16_red,)),),onTap: () {
                          Navigator.of(context).pop();
                        },)
                      ],),
                  )

                ],))),
        );
      },
    );
  }

  @override
  void initState() {
    //ContactApi().testRequest();
    Provider.of<TodoViewModel>(context, listen: false).getNoneDeletedTodos();
  }
}