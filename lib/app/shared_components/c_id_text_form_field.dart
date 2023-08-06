// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomIDTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomIDTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

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
