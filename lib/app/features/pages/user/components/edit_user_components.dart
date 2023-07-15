part of edit_user_page;

class EditUserPageBody extends StatefulWidget {
  
  final UserInfoModel _client;

  const EditUserPageBody(this._client, {super.key});

  @override
  State<EditUserPageBody> createState() => _EditUserPageBodyState();
}

class _EditUserPageBodyState extends State<EditUserPageBody> {
  
  late UserInfoModel dadosUsuario;
  late UserInfoModel? logedUser; 
  late TextEditingController _idEC;
  late TextEditingController _firstNameEC;
  late TextEditingController _lastNameEC;
  late TextEditingController _emailEC;
  late TextEditingController _roleEC;
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();
  final _senhaAtualEC = TextEditingController();
  final List<String> _items = ['ADMIN', 'USER'];
  bool _isAdmin = false;
  bool isLoading = true;
  
  @override
  void initState() {
    _init();
    dadosUsuario = widget._client;
    _idEC = TextEditingController(text: dadosUsuario.id.toString());
    _firstNameEC = TextEditingController(text: dadosUsuario.nome);
    _lastNameEC = TextEditingController(text: dadosUsuario.sobrenome);
    _emailEC = TextEditingController(text: dadosUsuario.email);
    _roleEC = TextEditingController(text: dadosUsuario.role);

    super.initState();
  }

  Future<void> _init() async {
    logedUser = await LocalStorageServices().getUser();
    setState(() {
      _isAdmin = logedUser!.isAdmin();
    });
    _setLoading();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return isLoading ? buildLoadingIndicator() : SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          addVerticalSpace(7),
          AvatarField(text: _emailEC.toString().substring(0,2).toUpperCase(),),
          addVerticalSpace(15),
          Visibility(
            visible: _isAdmin,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _idEC,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'ID',
                    ),
                  ),
                ),
                addHorizontalSpace(10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TypeAheadField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _roleEC,
                        decoration: const InputDecoration(
                          labelText: 'Cargo',
                          suffixIcon: Icon(Icons.arrow_drop_down),                                                          
                        ),
                      ),
                      suggestionsCallback: (pattern) {
                        return _items;
                      },
                      itemBuilder: (context, String cargo) {
                        return ListTile(
                          title: Text(cargo),
                        );
                      },
                      onSuggestionSelected: (String cargo) async {
                        setState(() {
                          _roleEC.text = cargo; 
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameEC,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextFormField(
                  controller: _lastNameEC,
                  decoration: const InputDecoration(
                    labelText: 'Sobrenome',
                  ),
                  validator: Validatorless.required('Sobrenome Obrigatório'),
                ),
              ),
            ],
          ),
          addVerticalSpace(10),
          CustomTextFormField(
            controller: _emailEC,
            labelText: 'Email',
            validator: [
              Validatorless.required('Email obrigatório'),
              Validatorless.email('Email invalido'),
            ]
          ),              
          addVerticalSpace(10),
          Visibility(
            visible: _isAdmin,
            child: CheckBoxField(
              email: _emailEC.text,
              isActive: dadosUsuario.habilitado!
            )
          ),
          addVerticalSpace(10),
          ExpansionTile(
            title: const Text('Alterar Senhas'),
            textColor: Pallete.gradient3,
            children: [
              addVerticalSpace(4),
                PasswordField(
                  labelText: "Senha Atual",
                  controller: _senhaAtualEC,
                  validator: [
                    Validatorless.required('É obrigatório inserir a Senha Atual'),
                    Validatorless.min(6, 'Senha Atual precisa ter no mínimo 6 caracteres'),
                  ]
                ),                  
              addVerticalSpace(10),
              PasswordField(
                labelText: "Nova Senha",
                controller: _passwordEC,
                validator: [
                  Validatorless.required('A Nova Senha é obrigatória'),
                  Validatorless.min(6, 'A Nova Senha precisa ter no mínimo 6 caracteres'),
                  Validators.difere(_senhaAtualEC, 'A Nova Senha precisa ser diferente da atual'),
                ]
              ),
              addVerticalSpace(10),
              PasswordField(
                labelText: 'Confirmar Nova Senha',
                controller: _confirmPasswordEC,
                validator: [
                  Validatorless.required('Confirmar nova Senha obrigatória'),
                  Validatorless.min(6, 'Confirmar Senha precisa ter no mínimo 6 caracteres'),
                  Validators.compare(_passwordEC, 'As Senhas não conferem'),
                ]
              ),
              addVerticalSpace(15),
            ],
          ),            
          addVerticalSpace(15),
          SizedBox(
            child: FilledButton(
              child: const Text(
                'Alterar Usuário',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                moreDetailsDialog(context, 'Funcionalidade em melhoria!', 'funcionalidade travada para refatoração :D');
                //Navigator.pop(context, UserInfoModel());
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
          ),
        ],
      ),
    );
  }
}

class AvatarField extends StatelessWidget {
  
  final String text;

  const AvatarField({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: Pallete.gradient3,
      maxRadius: 60,
      child: Text(
        text,
          style: const TextStyle(
            color: Pallete.whiteColor,
            fontSize: 35,
          ),
      ),
    );
  }
}


class CheckBoxField extends StatefulWidget {
  
  final bool isActive;
  final String email;

  const CheckBoxField({
    super.key,
    required this.isActive, required this.email,
  });

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {

  late bool isActive;
  late String email;
  bool isLoading = false;

  final UserRepository _userRepository = UserRepositoryImpl();

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
    email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isActive,
          onChanged: (value) {      
            setState(() {
              isActive = value!;
              waitProgressBar(context); 
              _userRepository.ativaUsuario(email).then((_) {
                Navigator.pop(context);
                String mensagem;
                mensagem = (isActive) ? 'habilitada' : 'desabilitada' ;
                moreDetailsDialog(context, 'Registrado com sucesso', 'Conta: $email $mensagem.');
              }).catchError((error) {
                Navigator.pop(context);
                tratarErro(context, error);
              });                 
            });
          },
        ),
        const Text(
          'Usuário Habilitado',
          style: TextStyle(
            fontSize: 16
          ),
        )
      ],
    );
  }
}