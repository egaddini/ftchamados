import 'package:get/get.dart';

import 'home_page.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomeController());
}
