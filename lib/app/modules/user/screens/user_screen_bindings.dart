import 'package:get/get.dart';

import 'user_screen_controller.dart';

class UserScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserScreenController());
  }
}
