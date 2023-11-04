import 'package:chamados/app/data/models/call_status_model.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/status/call_status_dropdown_repository.dart';
import 'package:get/get.dart';

class CallStatusDropdownController extends GetxController with StateMixin<List<CallStatusModel>> {

  final CallStatusDropdownRepository repository;

  CallStatusDropdownController(this.repository);

  @override
  void onInit() {
    repository.findAll().then((value) => change(value, status: RxStatus.success()));
    super.onInit();
  }

}