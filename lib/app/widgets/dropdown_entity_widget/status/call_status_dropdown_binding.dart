import 'package:chamados/app/widgets/dropdown_entity_widget/status/call_status_dropdown_controller.dart';
import 'package:get/get.dart';

import 'call_status_dropdown_repository.dart';

class CallStatusDropdownBinding implements Bindings {
  
@override
void dependencies() {

    Get.lazyPut<CallStatusDropdownController>(() => CallStatusDropdownController(CallStatusDropdownRepository(Get.find())));

  }
}