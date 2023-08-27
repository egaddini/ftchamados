import 'package:chamados/app/features/pages/login/login_screen_controller.dart';
import 'package:get/get.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
  
}