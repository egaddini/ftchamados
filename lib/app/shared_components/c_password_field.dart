import 'package:chamados/app/constans/pallete.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
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
        contentPadding: const EdgeInsets.all(23),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Pallete.backgroundColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,),
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
