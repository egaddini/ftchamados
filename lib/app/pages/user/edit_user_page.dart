import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/c_id_text_form_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';


class EditUserPage extends StatefulWidget {
  final UserInfoModel _client;
  EditUserPage(this._client);
  @override
  State<StatefulWidget> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  
  late TextEditingController _idEC;
  late TextEditingController _firstNameEC;
  late TextEditingController _lastNameEC;
  late TextEditingController _emailEC;
  late TextEditingController _roleEC;

  @override
  void initState() {

    UserInfoModel c = widget._client;
    _idEC = TextEditingController(text: c.id.toString());
    _firstNameEC = TextEditingController(text: c.firstname);
    _lastNameEC = TextEditingController(text: c.lastname);
    _emailEC = TextEditingController(text: c.email);
    _roleEC = TextEditingController(text: c.role);
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
        child: SizedBox(
          width: 400,
          child: ListView(
            children: [
              const SizedBox(height: 60),
              CustomIDTextFormField(
                controller: _idEC,
                labelText: 'ID',
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
                controller: _roleEC,
                labelText: 'Cargo',
                validator: [
                  Validatorless.required('Cargo obrigatório'),
                ]
              ),
              const SizedBox(height: 15),
              /*ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, UserInfoModel());
                  },
                  child: const Text("Salvar Contato")
              ),*/
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
            ],
          ),
        ),
      ),
    );
  }
}