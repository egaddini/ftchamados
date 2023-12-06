import 'package:chamados/app/modules/drawer/drawer_repository.dart';
import 'package:get/get.dart';

import 'package:chamados/app/modules/drawer/menu_drawer_controller.dart';

class MenuDrawerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuDrawerController>(() => MenuDrawerController(Get.put(DrawerRepository(Get.find()))));

  }
}
