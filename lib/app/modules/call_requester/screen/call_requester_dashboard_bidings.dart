import 'package:chamados/app/modules/call/call_repository_impl.dart';
import 'package:get/get.dart';

import 'call_requester_dashboard_controller.dart';

class CallRequesterDashboardBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CallRequesterDashboardController(callRepo: Get.put<CallRepository>(CallRepository())));
  }

}
