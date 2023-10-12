import 'package:get/get.dart';

import 'package:chamados/app/modules/call_status/call_status_repository.dart';

import 'call_status_controller.dart';

class CallStatusBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallStatusController(CallStatusRepository()));
  }
}
