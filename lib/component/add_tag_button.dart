import 'package:flutter/material.dart';

class AddTagButton extends StatelessWidget {
  final Function() onPressed;

  const AddTagButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(Colors.blueAccent.withAlpha(40)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        'Add a New Tag',
        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
      ),
    );
  }
}
