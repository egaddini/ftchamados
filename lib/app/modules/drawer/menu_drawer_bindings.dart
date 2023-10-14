import 'package:chamados/app/modules/drawer/menu_drawer_controller.dart';
import 'package:get/get.dart';

class MenuDrawerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MenuDrawerController>(() => MenuDrawerController());
  }
}