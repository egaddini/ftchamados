import 'package:get/get.dart';

import 'package:chamados/app/modules/singup/singup_controller.dart';

class SingUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingUpController>(() => SingUpController());
  }
}
