import 'package:get/get.dart';

import 'call_requester_dashboard_controller.dart';

class CallRequesterDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallRequesterDashboardController());
  }
}
