// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {

  @override
  Widget build(BuildContext context) {
  return TextFormField(
    controller: widget.controller,
    obscureText: true,
    decoration: const InputDecoration(
      labelText: 'Senha',
      border:  OutlineInputBorder(),
      /*suffixIcon:GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
      ),*/
    ),
    validator: Validatorless.multiple([
      Validatorless.required('Senha obrigatória'),
      Validatorless.min(6, 'Senha precisa ter no mínimo 6 caracteres'),
    ]),
   );
  }
}
