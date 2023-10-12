import 'package:get/get.dart';

import 'home_screen.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomeScreenController());
}
