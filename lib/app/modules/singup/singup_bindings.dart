import 'package:chamados/app/modules/singup/singup_repository.dart';
import 'package:get/get.dart';

import 'package:chamados/app/modules/singup/singup_controller.dart';

class SingUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingUpController>(() => SingUpController(singupRepository: SingUpRepository(Get.find())));
  }
}
