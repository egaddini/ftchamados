import 'package:chamados/app/widgets/dropdown_entity_widget/user/user_dropdown_controller.dart';
import 'package:get/get.dart';

import 'user_dropdown_repository.dart';

class UserDropdownBinding implements Bindings {
  
@override
void dependencies() {

    Get.lazyPut<UserDropdownController>(() => UserDropdownController(UserDropdownRepository(Get.find())), fenix: true);

  }
}