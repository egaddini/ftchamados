part of singup_screen;

class SingupForm extends StatefulWidget {
  const SingupForm({super.key});

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {

  bool isLoading = false;
  AuthRepository authRepository = AuthRepositoryImpl();

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') });

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _surnameEC = TextEditingController();
  final _usernameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

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
  
  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? buildLoadingIndicator() : Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Crie sua conta',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),                       
          addVerticalSpace(20),                            
          TextFormField(
            controller: _nameEC,
            decoration: const InputDecoration(
              labelText: 'Nome', 
            ),
            validator: Validatorless.required('Nome Obrigatório'),
          ),
          addVerticalSpace(10),
          TextFormField(
            controller: _surnameEC,
            decoration: const InputDecoration(
              labelText: 'Sobrenome', 
            ),
            validator: Validatorless.required('Sobrenome Obrigatório'),
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
          TextFormField(
            controller: _phoneEC,
            inputFormatters: [maskFormatter],
            decoration: const InputDecoration(
              labelText: 'Telefone', 
            ),
            validator: Validatorless.required('Telefone Obrigatório'),
            
          ),
          addVerticalSpace(10),
          PasswordField(
            labelText: "Senha",
            controller: _passwordEC,
            validator: [
              Validatorless.required('Confirmar senha obrigatória'),
              Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
            ]
          ),
          addVerticalSpace(10),
          PasswordField(
            labelText: 'Confirmar Senha',
            controller: _confirmPasswordEC,
            validator: [
              Validatorless.required('Confirmar senha obrigatória'),
              Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
              Validators.compare(_passwordEC, 'Senhas não conferem'),
            ]
          ),
          addVerticalSpace(15),
          Row(
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text(
                  'Voltar e entrar',
                  style: TextStyle(
                    color: Pallete.gradient3,
                  ),
                ),
              ),
              addHorizontalSpace(176),
              Expanded(
                child: FilledButton(
                  child:  isLoading ? buildLoadingIndicator() :  const Text('Avançar'),
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      setState(() {
                        userModel = UserModel(
                          firstname: _nameEC.text,
                          lastname: _surnameEC.text,
                          phone: int.parse(_phoneEC.text.replaceAll(' ', '').replaceAll(')', '').replaceAll('(', '').replaceAll('-', '')),
                          email: _emailEC.text,
                          password: _passwordEC.text
                        );
                      });
                      _setLoading();
                      authRepository.register(userModel!).then((_) {
                        _setLoading();
                        registerSucess(context, 'Conta registrada com sucesso!', 'Sua solicitação será revisada e conta habilitada em até 2 dias úteis.');
                      }).catchError((error) {
                        _setLoading();
                        tratarErro(context, error);
                      });                                                 
                    }
                  }, 
                ),
              ),
            ],
          ),
          addVerticalSpace(150),
        ],
      ),
    );
  }
}

