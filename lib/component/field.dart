import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Field extends StatelessWidget {

  final double width;
  final int maxLength;
  final int maxLine;
  final String hint;
  final TextEditingController textEditingController;
  const Field({Key key,this.width,this.maxLength,this.maxLine,this.hint,this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color borderColor = theme.primaryColor;
    return Center(
      child: SizedBox(
        width: width,
        child: TextField(
          controller: textEditingController,
          maxLength: maxLength,
          maxLines: maxLine,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: borderColor, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
