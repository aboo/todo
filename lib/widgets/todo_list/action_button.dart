import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color backGroundColor;
  final Function onTap;
  final Widget title;

  const ActionButton({Key key, this.backGroundColor, this.onTap, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backGroundColor),
        child: title,
        alignment: Alignment.center,
      ),
    );
  }
}
