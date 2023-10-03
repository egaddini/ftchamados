import 'package:get/get.dart';

import 'call_solver_dashboard_controller.dart';

class CallSolverDashboardBindings extends Bindings {

  @override
  void dependencies() {
      Get.lazyPut(() => CallSolverDashboardController());
  }
  
}