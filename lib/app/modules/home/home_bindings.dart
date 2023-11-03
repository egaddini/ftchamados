import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_binding.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    CallSectorDropdownBinding().dependencies();
  } 
}
