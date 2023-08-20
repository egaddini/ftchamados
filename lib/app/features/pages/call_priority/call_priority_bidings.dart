import 'package:chamados/app/repositories/call/priority/priority_repository.dart';
import 'package:get/get.dart';

import 'call_priority_controller.dart';

class CallPriorityBindings implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CallPriorityController(PriorityRepository()));
  }

}