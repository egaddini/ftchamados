import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';


class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterUserScreen();
}

class _RegisterUserScreen extends State<RegisterUserScreen> {
  //final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _surnameEC = TextEditingController();
  final _usernameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _surnameEC.dispose();
    _usernameEC.dispose();
    _phoneEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Registrar Usuário")
          ),
          backgroundColor: Get.theme.primaryColor,
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            child: ListView(
              children: [
                const SizedBox(height: 60),                            
                CustomTextFormField(
                  controller: _nameEC,
                  labelText: 'Nome',
                  validator: [
                    Validatorless.required('Nome Obrigatório'),
                  ]
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _surnameEC,
                  labelText: 'Sobrenome',
                  validator: [
                    Validatorless.required('Sobrenome Obrigatório'),
                  ]
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _emailEC,
                  labelText: 'Email',
                  validator: [
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('Email invalido'),
                  ]
                ),
                const SizedBox(height: 10),                          
                CustomTextFormField(
                  controller: _phoneEC,
                  labelText: 'Telefone',
                  validator: [
                    Validatorless.required('Telefone Obrigatório'),
                  ]
                ),
                const SizedBox(height: 10),
                PasswordField(
                  labelText: "Senha",
                  controller: _passwordEC,
                  validator: [
                    Validatorless.required('Confirmar senha obrigatória'),
                    Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
                  ]),
                const SizedBox(height: 10),
                PasswordField(
                  labelText: 'Confirmar Senha',
                  controller: _confirmPasswordEC,
                  validator: [
                    Validatorless.required('Confirmar senha obrigatória'),
                    Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
                    Validators.compare(_passwordEC, 'Senhas não conferem'),
                  ]),
                const SizedBox(height: 15),                
                ElevatedButton(                          
                  child: const Text(
                    'Alterar Usuário',
                  ),
                  onPressed: () {
                    Navigator.pop(context,
                        UserInfoModel()
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}