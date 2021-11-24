
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final Color textColor;
  const TagChip({Key key,@required this.name,this.backgroundColor,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Chip(label: Text(name,style: TextStyle(color: textColor),),backgroundColor: backgroundColor,));
  }
}
