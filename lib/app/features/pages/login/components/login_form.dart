part of login_screen;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final AuthRepository authRepository = AuthRepositoryImpl();

  LoginModel? loginModel;

  bool isLoading = false;

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

    void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
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
            child: isLoading ? buildLoadingIndicator() : Column(
              children: [
                addVerticalSpace(60),
                const Text(
                  'Bem-Vindo Novamente',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),                       
                addVerticalSpace(20),
                CustomTextFormField(
                  controller: _emailEC,
                  labelText: 'Email',
                  validator: [
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('Email inválido'),
                  ]
                ),
                addVerticalSpace(20),
                PasswordField(
                  labelText: "Senha",
                  controller: _passwordEC,
                  validator: [
                    Validatorless.required('Confirmar senha obrigatória'),
                    Validatorless.min(6, 'Confirmar senha precisa ter no mínimo 6 caracteres'),
                  ]),
                addVerticalSpace(20),
                Column(                           
                  children: [
                    FilledButton(                                  
                      child: const Text('Continuar',),
                      onPressed: () async {
                        var formValid = _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          setState(() {
                            loginModel = LoginModel(
                              email: _emailEC.text,
                              password: _passwordEC.text
                            );
                          }); 
                          try {
                            _setLoading();
                        await waitThreeSeconds();
                            await authRepository.authenticate(loginModel!);
                            Navigator.popAndPushNamed(context, 'home');
                          } on DioError catch (e) {
                            _setLoading();
                            tratarErro(context, e);
                          }
                        } 
                      }, 
                    ),
                  ],
                ),
                addVerticalSpace(20),
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
                addVerticalSpace(20),
                const Row(
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
                addVerticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    
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
                  child: const Row(
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
    );
  }
}