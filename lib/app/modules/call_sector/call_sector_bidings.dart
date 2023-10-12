import 'package:get/get.dart';

import 'package:chamados/app/modules/call_sector/setor_repository.dart';

import 'call_sector_controller.dart';

class CallSectorBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallSectorController(SectorRepository()));
  }
}
