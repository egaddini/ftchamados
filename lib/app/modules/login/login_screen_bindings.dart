import 'package:chamados/app/modules/login/login_repository.dart';
import 'package:get/get.dart';

import 'login_screen_controller.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController(loginRepository: LoginRepository(Get.find())));
  }
}
