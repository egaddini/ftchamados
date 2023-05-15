// ignore_for_file: public_member_api_docs, sort_constructors_first
part of edit_user_page;

class EditUserPageBody extends StatefulWidget {
  
  final UserInfoModel _client;

  const EditUserPageBody(this._client);

  @override
  State<EditUserPageBody> createState() => _EditUserPageBodyState();
}

class _EditUserPageBodyState extends State<EditUserPageBody> {

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
  final _senhaAtualEC = TextEditingController();
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
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        addVerticalSpace(30),
        AvatarField(text: logedUser.email.toString().substring(0,2).toUpperCase(),),
        addVerticalSpace(15),
        Visibility(
          visible: _isAdmin,
          child: IDField(text: _idEC),
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
        CustomTextFormField(
          controller: _firstNameEC,
          labelText: 'Nome',
          validator: [
            Validatorless.required('Nome Obrigatório'),
          ]
        ),
        addVerticalSpace(10),
        CustomTextFormField(
          controller: _lastNameEC,
          labelText: 'Sobrenome',
          validator: [
            Validatorless.required('Sobrenome Obrigatório'),
          ]
        ),
        addVerticalSpace(10),
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
        addVerticalSpace(10),
        Visibility(
          visible: _isAdmin,
          child: CheckBoxField(isActive: usuarioLogado.habilitado!)
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
          ],
        ),            
        addVerticalSpace(15),

        SizedBox(
          child: ElevatedButton(
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
        ),
        addVerticalSpace(10),
      ],
    );
  }
}

class IDField extends StatelessWidget {
  final TextEditingController text;

  const IDField({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              child: TextFormField(
                controller: text,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'ID',
                ),
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

  const CheckBoxField({
    super.key,
    required this.isActive,
  });

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {

  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
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