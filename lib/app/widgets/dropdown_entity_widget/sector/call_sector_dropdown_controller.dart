import 'package:chamados/app/data/models/sector_model.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_repository.dart';
import 'package:get/get.dart';

class CallSectorDropdownController extends GetxController with StateMixin<List<SectorModel>> {

  final CallSectorDropdownRepository repository;

  CallSectorDropdownController(this.repository);

  @override
  void onInit() {
    repository.findAll().then((value) => change(value, status: RxStatus.success()));
    super.onInit();
  }

}