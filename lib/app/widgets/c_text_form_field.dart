import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final List<FormFieldValidator<String>> validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
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
