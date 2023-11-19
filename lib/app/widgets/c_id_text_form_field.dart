import 'package:flutter/material.dart';

// ignore_for_file: file_names

class CustomIDTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomIDTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: false,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
