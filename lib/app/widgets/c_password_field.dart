import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final List<FormFieldValidator<String>> validator;

  const PasswordField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
  });

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
      ),
      validator: (value) {
        for (final validate in widget.validator) {
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
