import 'package:chamados/app/features/pages/call_status/call_status_controller.dart';
import 'package:get/get.dart';

class CallStatusBindings implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CallStatusController());
  }

}