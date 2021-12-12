import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const TagWidget({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(title),
    );
  }
}
