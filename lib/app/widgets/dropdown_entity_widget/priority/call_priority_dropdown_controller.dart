import 'package:chamados/app/data/models/priority.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_repository.dart';
import 'package:get/get.dart';

class CallPriorityDropdownController extends GetxController with StateMixin<List<PriorityModel>> {

  final CallPriorityDropdownRepository repository;

  CallPriorityDropdownController(this.repository);

  @override
  void onInit() {
    repository.findAll().then((value) => change(value, status: RxStatus.success()));
    super.onInit();
  }

}