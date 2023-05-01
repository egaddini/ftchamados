import 'package:chamados/app/models/user_model.dart';
import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/repositories/user_repository.dart';
import 'package:chamados/app/repositories/user_repository_impl.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class SingupPage extends StatefulWidget {


  const SingupPage({ Key? key }) : super(key: key);

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _surnameEC = TextEditingController();
  final _usernameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

    final UserRepository userRepository = UserRepositoryImpl();
    UserModel? userModel;

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
              appBar: null,
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          const Text(
                            'Crie sua conta',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),                       
                          const SizedBox(height: 20),                            
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
                          Row(
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, 'login');
                                }, 
                                child: const Text(
                                  'Voltar e entrar',
                                  style: TextStyle(
                                    color: Pallete.gradient3,
                                  ),
                                ),
                              ),
                              /*ElevatedButton(
                                child: const Text('Voltar'),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                }, 
                                style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(120, 45),|
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3),                                    
                                ),
                              ),*/
                              const SizedBox(width: 176),
                              ElevatedButton(
                                onPressed: () async {
                                  var formValid = _formKey.currentState?.validate() ?? false;
                                  if (formValid) {
                                    setState(() {
                                      userModel = UserModel(
                                        firstname: _nameEC.text,
                                        lastname: _surnameEC.text,
                                        email: _emailEC.text,
                                        password: _passwordEC.text
                                      );
                                    });                      
                                    var response = await userRepository.saveUser(userModel!);
                                    if (response.isNotEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Seja bem vindo'),
                                          backgroundColor: Pallete.gradient3,
                                        ),
                                      );
                                      Navigator.pushNamed(context, 'home');
                                    }
                                  }
                                }, 
                                child: const Text('Avançar'),
                                style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(120, 45),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3),                                    
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          );
  }
}