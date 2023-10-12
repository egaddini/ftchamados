import 'package:flutter/material.dart';

class CustomExpandedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final int maxLines;
  final bool readOnly;

  const CustomExpandedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
    this.readOnly = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
