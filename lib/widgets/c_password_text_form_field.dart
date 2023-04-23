// ignore_for_file: file_names

import 'package:chamados/pallete.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
  return TextFormField(
    controller: widget.controller,
    obscureText: _obscureText,
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.all(23),
      labelText: 'Senha',
      labelStyle: TextStyle(
        color: Pallete.gradient3,
      ),
      border:  OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.gradient3,
          width: 2,
        ),
      ),
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
