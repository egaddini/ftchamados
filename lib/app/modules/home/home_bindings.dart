import 'package:chamados/app/modules/home/home_repository.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_binding.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.put(HomeRepository(Get.find()))));

    CallSectorDropdownBinding().dependencies();
    CallPriorityDropdownBinding().dependencies();
  } 

}
