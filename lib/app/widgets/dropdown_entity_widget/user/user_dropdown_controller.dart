import 'package:chamados/app/widgets/dropdown_entity_widget/user/user_dropdown_repository.dart';
import 'package:get/get.dart';

class UserDropdownController extends GetxController with StateMixin<List<String>> {

  final UserDropdownRepository repository;

  UserDropdownController(this.repository);

  @override
  void onInit() {
    repository.findAll().then((value) => change(value.map((x) => x.email).toList(), status: RxStatus.success()));
    super.onInit();
  }

}