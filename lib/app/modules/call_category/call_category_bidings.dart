import 'package:get/get.dart';

import 'package:chamados/app/modules/call_category/call_category_repository.dart';

import 'call_category_controller.dart';

class CallCategoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallCategoryController(CallCategoryRepository()));
  }
}
