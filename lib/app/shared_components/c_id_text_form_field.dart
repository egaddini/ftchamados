// ignore_for_file: file_names

import 'package:chamados/app/constans/pallete.dart';
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
        fillColor: Colors.grey[300],
        filled: true, 
        contentPadding: const EdgeInsets.all(23),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Pallete.backgroundColor,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Pallete.gradient3,
            width: 2,
          ),
        ),        
      ),
    );
  }
}
