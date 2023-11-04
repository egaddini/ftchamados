import 'package:chamados/app/modules/call_solver/screen/call_solver_dashboard_repository.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/category/call_category_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/status/call_status_dropdown_binding.dart';
import 'package:get/get.dart';

import 'call_solver_dashboard_controller.dart';

class CallSolverDashboardBindings extends Bindings {

  @override
  void dependencies() {

     Get.lazyPut(() => CallSolverDashboardController(Get.put(CallSolverDashboardRepository(Get.find()))));

    CallSectorDropdownBinding().dependencies();
    CallPriorityDropdownBinding().dependencies();
    CallCategoryDropdownBinding().dependencies();
    CallStatusDropdownBinding().dependencies();
  }
}
