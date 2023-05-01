import 'package:chamados/app/constans/pallete.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final List<FormFieldValidator<String>> validator;

  const PasswordField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
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
