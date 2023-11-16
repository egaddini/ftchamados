import 'package:chamados/app/modules/user/user_controller.dart';
import 'package:chamados/app/modules/user/user_repository.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(Get.put(UserRepository(Get.find()))));
  }
}
