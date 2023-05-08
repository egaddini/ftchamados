import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/c_id_text_form_field.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:chamados/app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';


class EditUserPage extends StatefulWidget {
  final UserInfoModel _client;
  
  EditUserPage(this._client);
  @override
  State<StatefulWidget> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  
  late UserInfoModel usuarioLogado;
  late TextEditingController _idEC;
  late TextEditingController _firstNameEC;
  late TextEditingController _lastNameEC;
  late TextEditingController _emailEC;
  late TextEditingController _roleEC;
  late TextEditingController _habilitadoEC;
  late UserInfoModel logedUser;
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  UserService userSvc = UserServiceImpl();
  bool _isAdmin = false;

  @override
  void initState() {
    usuarioLogado = widget._client;
    _idEC = TextEditingController(text: usuarioLogado.id.toString());
    _firstNameEC = TextEditingController(text: usuarioLogado.nome);
    _lastNameEC = TextEditingController(text: usuarioLogado.sobrenome);
    _emailEC = TextEditingController(text: usuarioLogado.email);
    _roleEC = TextEditingController(text: usuarioLogado.role);
    _habilitadoEC = TextEditingController(text: usuarioLogado.habilitado.toString());
    logedUser = userSvc.getLogedUserInfo();
    _isAdmin = logedUser.isAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_emailEC.text)
        ),
        backgroundColor: Pallete.gradient3,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          //width: 400,
          child: ListView(
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                backgroundColor: Pallete.gradient3,
                maxRadius: 60,
                child: Text(
                  logedUser.email.toString().substring(0,2).toUpperCase(),
                   style: const TextStyle(
                      color: Pallete.whiteColor,
                      fontSize: 35,
                   ),
                ),
              ),
              const SizedBox(height: 15),
              Visibility(
                visible: _isAdmin,
                child: CustomIDTextFormField(
                  controller: _idEC,
                  labelText: 'ID',
                ),
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
                controller: _firstNameEC,
                labelText: 'Nome',
                validator: [
                  Validatorless.required('Nome Obrigatório'),
                ]
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: _lastNameEC,
                labelText: 'Sobrenome',
                validator: [
                  Validatorless.required('Sobrenome Obrigatório'),
                ]
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: _isAdmin,
                child: CustomTextFormField(
                  controller: _roleEC,
                  labelText: 'Cargo',
                  validator: [
                    Validatorless.required('Cargo obrigatório'),
                  ]
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: usuarioLogado.habilitado,
                    onChanged: (value) {
                      setState(() {
                        usuarioLogado.habilitado = value;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Usuário Habilitado',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    )
                  ),
                ],
              ),

              const SizedBox(height: 10),
              ExpansionTile(
                title: const Text('Alterar Senhas'),
                textColor: Pallete.gradient3,
                children: [
                  const SizedBox(height: 4,),
                  PasswordField(
                    labelText: "Senha",
                    controller: _passwordEC,
                    validator: [
                      Validatorless.required('Confirmar senha obrigatória'),
                      Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
                    ]
                  ),
                  const SizedBox(height: 10),
                  PasswordField(
                    labelText: 'Confirmar Senha',
                    controller: _confirmPasswordEC,
                    validator: [
                      Validatorless.required('Confirmar senha obrigatória'),
                      Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
                      Validators.compare(_passwordEC, 'Senhas não conferem'),
                    ]
                  ),
                ],
              ),            
              const SizedBox(height: 15),
              Column(                           
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                        const Size(410, 65),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3),                                    
                    ),
                    child: const Text(
                      'Alterar Usuário',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, UserInfoModel());
                      /*var formValid = _formKey.currentState?.validate() ?? false;
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
                      }*/ 
                    }, 
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}