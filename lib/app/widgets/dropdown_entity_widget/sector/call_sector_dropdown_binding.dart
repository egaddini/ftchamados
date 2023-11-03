import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_controller.dart';
import 'package:get/get.dart';

import 'call_sector_dropdown_repository.dart';

class CallSectorDropdownBinding implements Bindings {
  
@override
void dependencies() {

    Get.lazyPut<CallSectorDropdownController>(() => CallSectorDropdownController(CallSectorDropdownRepository(Get.find())));

  }
}