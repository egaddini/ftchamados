import 'package:get/get.dart';

import 'package:chamados/app/modules/call_priority/priority_repository.dart';

import 'call_priority_controller.dart';

class CallPriorityBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallPriorityController(PriorityRepository()));
  }
}
