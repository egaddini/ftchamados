part of login_screen;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final LoginScreenController _controller = Get.put(LoginScreenController());

  LoginModel? loginModel;

  @override
  Widget build(BuildContext context) {
    return _controller.isLoading.value ? buildLoadingIndicator() :  Form(
      key: _controller._formKey,
      child: Center(
        child: Column(
          children: [
            const Text('Bem-Vindo Novamente', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,),),                       
            addVerticalSpace(50),
            CustomTextFormField(
              controller: _controller._emailEC,
              labelText: 'Email',
              validator: [
                Validatorless.required('Email obrigatório'),
                Validatorless.email('Email inválido'),
              ]
            ),
            addVerticalSpace(20),
            PasswordField(
              labelText: "Senha",
              controller: _controller._passwordEC,
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
                    var formValid = _controller._formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      setState(() {
                        loginModel = LoginModel(
                          email: _controller._emailEC.text,
                          password: _controller._passwordEC.text
                        );
                      });
                      _controller.isLoading.value = true;
                      _controller.authRepository.authenticate(loginModel!).then((_) {
                        Get.offAndToNamed(AppRoutes.home);
                      }).catchError((error) {
                        _controller.isLoading.value = false;
                        tratarErro(context, error);
                      }); 
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
                TextButton(onPressed: () => Get.toNamed(AppRoutes.singup), child: const Text('Entre aqui',),),
              ],
            ),
            addVerticalSpace(20),
            const Row(
              children: [
                Expanded(child:Divider(),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('OU', textAlign: TextAlign.center,),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.g_translate, color: Get.theme.primaryColor,),
                  const SizedBox(width: 16.0),
                  Text('Entrar com o Google', style: TextStyle(fontSize: 16, color: Get.theme.primaryColor),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}