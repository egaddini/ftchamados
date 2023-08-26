import 'package:chamados/app/repositories/call/category/call_category_repository.dart';
import 'package:get/get.dart';

import 'call_category_controller.dart';

class CallCategoryBindings implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CallCategoryController(CallCategoryRepository()));
  }

}