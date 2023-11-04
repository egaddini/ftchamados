import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/category/call_category_dropdown_repository.dart';
import 'package:get/get.dart';

class CallCategoryDropdownController extends GetxController with StateMixin<List<CallCategoryModel>> {

  final CallCategoryDropdownRepository repository;

  CallCategoryDropdownController(this.repository);

  @override
  void onInit() {
    repository.findAll().then((value) => change(value, status: RxStatus.success()));
    super.onInit();
  }

}