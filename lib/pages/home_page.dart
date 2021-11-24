import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/add_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AddItemPage(),
    );
  }
}
