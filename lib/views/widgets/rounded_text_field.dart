import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    required this.label,
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.minLines = 1,
    this.hintText,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final String? hintText;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      textAlign: TextAlign.start,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: minLines + 1,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
