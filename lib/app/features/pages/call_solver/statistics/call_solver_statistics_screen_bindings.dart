import 'package:chamados/app/features/pages/call_solver/statistics/call_solver_statistics_screen_controller.dart';
import 'package:get/get.dart';

class CallSolverStatisticsScreenBindings extends Bindings {

  @override
  void dependencies() { 
    Get.lazyPut(() => CallSolverStatisticsScreenController(),);
  }
  
}