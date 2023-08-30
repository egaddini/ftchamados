import 'package:chamados/app/features/pages/call_requester/screen/call_requester_dashboard_controller.dart';
import 'package:get/get.dart';

class CallRequesterDashboardBindings extends Bindings {


  @override
  void dependencies() {
      Get.lazyPut(() => CallRequesterDashboardController());
  }
  
}