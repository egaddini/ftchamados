import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/login_model.dart';
import 'package:chamados/app/utils/repositories/auth_repository.dart';
import 'package:chamados/app/utils/repositories/auth_repository_impl.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final AuthRepository authRepository = AuthRepositoryImpl();

  LoginModel? loginModel;

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
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
                    child: Container(
                      width: 400,
                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          const Text(
                            'Bem-Vindo Novamente',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),                       
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            controller: _emailEC,
                            labelText: 'Email',
                            validator: [
                              Validatorless.required('Email obrigatório'),
                              Validatorless.email('Email inválido'),
                            ]
                          ),
                          const SizedBox(height: 20),
                          PasswordField(
                            labelText: "Senha",
                            controller: _passwordEC,
                            validator: [
                              Validatorless.required('Confirmar senha obrigatória'),
                              Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
                            ]),
                          const SizedBox(height: 20),
                          Column(                           
                            children: [
                              FilledButton(                                  
                                child: const Text(
                                  'Continuar',
                                ),
                                onPressed: () async {
                                var formValid = _formKey.currentState?.validate() ?? false;
                                  if (formValid) {
                                    setState(() {
                                      loginModel = LoginModel(
                                        email: _emailEC.text,
                                        password: _passwordEC.text
                                      );
                                    });                      
                                    String? response = await authRepository.authenticate(loginModel!);
                                    if (response != null) {
                                      Navigator.pushNamed(context, 'home');
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('As credenciais informadas não batem. Tente novamente.'),
                                          backgroundColor: Pallete.gradient3,
                                        ),
                                      );
                                    }
                                    Navigator.pushNamed(context, 'home');
                                  } 
                                }, 
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Não tem uma conta?'),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, 'singup');
                                }, 
                                child: const Text(
                                  'Entre aqui',
                                  style: TextStyle(
                                    color: Pallete.gradient3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child:Divider(),),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'OU',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(child:Divider(),),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Adicione aqui a lógica de autenticação com o Google.
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(410, 65),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                  side: const BorderSide(color: Color(0xFFBDBDBD)),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.g_translate,
                                  color: Pallete.borderColor,
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  'Entrar com o Google',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Pallete.borderColor),
                                ),
                              ],
                            ),
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