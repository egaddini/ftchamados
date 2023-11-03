import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_controller.dart';
import 'package:get/get.dart';

import 'call_priority_dropdown_repository.dart';

class CallPriorityDropdownBinding implements Bindings {
  
@override
void dependencies() {

    Get.lazyPut<CallPriorityDropdownController>(() => CallPriorityDropdownController(CallPriorityDropdownRepository(Get.find())));

  }
}