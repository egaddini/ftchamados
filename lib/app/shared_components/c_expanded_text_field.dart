import 'package:flutter/material.dart';

class CustomExpandedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final int maxLines;

  const CustomExpandedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        readOnly: true,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}