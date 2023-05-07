import 'package:flutter/material.dart';

class CustomExpandedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;

  const CustomExpandedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}