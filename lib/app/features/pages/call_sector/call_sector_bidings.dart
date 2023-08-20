import 'package:chamados/app/utils/repositories/call/setor/setor_repository.dart';
import 'package:get/get.dart';
import 'call_sector_controller.dart';

class CallSectorBindings implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CallSectorController(SetorRepository()));
  }

}