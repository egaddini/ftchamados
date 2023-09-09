import 'package:chamados/app/features/pages/user/screens/user_screen_controller.dart';
import 'package:get/get.dart';

class UserScreenBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => UserScreenController());
  }
  
}