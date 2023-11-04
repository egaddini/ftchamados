import 'package:chamados/app/widgets/dropdown_entity_widget/category/call_category_dropdown_controller.dart';
import 'package:get/get.dart';

import 'call_category_dropdown_repository.dart';

class CallCategoryDropdownBinding implements Bindings {
  
@override
void dependencies() {

    Get.lazyPut<CallCategoryDropdownController>(() => CallCategoryDropdownController(CallCategoryDropdownRepository(Get.find())));

  }
}