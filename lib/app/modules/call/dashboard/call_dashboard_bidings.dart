import 'package:chamados/app/modules/call/dashboard/call_dashboard_repository.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/category/call_category_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_binding.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/status/call_status_dropdown_binding.dart';
import 'package:get/get.dart';

import 'call_dashboard_controller.dart';

class CallDashboardBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CallDashboardController(Get.put(CallDashboardRepository(Get.find()))));

    CallSectorDropdownBinding().dependencies();
    CallPriorityDropdownBinding().dependencies();
    CallCategoryDropdownBinding().dependencies();
    CallStatusDropdownBinding().dependencies();
  }

}
