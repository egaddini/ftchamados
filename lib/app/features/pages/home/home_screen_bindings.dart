import 'package:chamados/app/features/pages/home/home_screen.dart';
import 'package:get/get.dart';

class HomeScreenBindings extends Bindings {
  
  @override
  void dependencies() => Get.lazyPut(() => HomeScreenController());
  
}