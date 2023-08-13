part of login_screen;

class LoginScreenController extends GetxController {

  RxBool isLoading = false.obs;

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final AuthRepository authRepository = AuthRepositoryImpl();


  @override
  void onInit() {
    
    super.onInit();
  }
  
}