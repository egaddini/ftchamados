import 'package:chamados/pallete.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final List<FormFieldValidator<String>> validator;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(23),
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
      validator: (value) {
        for (final validate in validator) {
          final error = validate(value ?? '');
          if (error != null) {
            return error;
          }
        }
        return null;
      },
    );
  }
}
