import 'package:get/get.dart';

import 'call_solver_statistics_screen_controller.dart';

class CallSolverStatisticsScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CallSolverStatisticsScreenController(),
    );
  }
}
