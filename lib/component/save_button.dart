import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onPressed;
  const SaveButton({Key key,@required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                const Color(0xB52A7B1E)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20)),
            textStyle: MaterialStateProperty.all(const TextStyle(
              color: Colors.black,
            )),
            shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ))),
        onPressed: onPressed,
        child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
    );
  }
}
