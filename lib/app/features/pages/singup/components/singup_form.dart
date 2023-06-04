part of singup_screen;

class SingupForm extends StatefulWidget {
  const SingupForm({super.key});

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                addVerticalSpace(40),
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
                  //inputFormatters: [maskFormatter],
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
                        child: const Text('Avançar'),
                        onPressed: () async {
                          var formValid = _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            setState(() {
                              userModel = UserModel(
                                firstname: _nameEC.text,
                                lastname: _surnameEC.text,
                                phone: int.parse(_phoneEC.text),
                                email: _emailEC.text,
                                password: _passwordEC.text
                              );
                            });

                            try {
                              await authRepository.register(userModel!);
                            } catch (e) {
                              
                            }                      
                            // if (response.isNotEmpty) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text('Seja bem vindo'),
                            //       backgroundColor: Pallete.gradient3,
                            //     ),
                            //   );
                            //    Navigator.pop(context);
                            // }
                          }
                        }, 
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}