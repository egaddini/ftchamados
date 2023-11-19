import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/user/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:chamados/core/utils/helper.dart';
import '../../../data/models/sector_model.dart';
import '../../../data/models/user_info_model.dart';
import '../../../data/models/user_model.dart';

class UserDetailsDialogController extends GetxController
    with StateMixin<List<dynamic>> {
  final UserInfoModel user;

  late UserInfoModel logedUser;
  late TextEditingController idEC, firstNameEC, lastNameEC, emailEC, roleEC;
  final passwordEC = TextEditingController(),
      confirmPasswordEC = TextEditingController(),
      senhaAtualEC = TextEditingController();
  final List<String> roles = ['ADMIN', 'USER', 'SOLVER'];
  final passwordKey = GlobalKey<FormState>(),
      generalKey = GlobalKey<FormState>();
  final UserRepository _repository;

  RxBool isAdmin = true.obs;
  final RxList<SectorModel> sectors = <SectorModel>[].obs,
  selectedItens = <SectorModel>[].obs;

  UserDetailsDialogController(this.user, this._repository);

  @override
  void onInit() {
    logedUser = AppConfigService().to().userData();
    isAdmin.value = logedUser.isAdmin();

    selectedItens.value = user.sectors;
    _repository.findSectors().then((value) => sectors.value = value);

    idEC = TextEditingController(text: user.id.toString());
    firstNameEC = TextEditingController(text: user.firstName);
    lastNameEC = TextEditingController(text: user.lastName);
    emailEC = TextEditingController(text: user.email);
    roleEC = TextEditingController(text: user.role);

    super.onInit();
  }

  void alterarUsuario() {
    var passValid = passwordKey.currentState?.validate() ?? false;
    if (isAdmin.value || (!isAdmin.value && passValid)) {
      var dataValid = generalKey.currentState?.validate() ?? false;
      if (dataValid) {
        UserModel userChanged = UserModel(
          firstname: firstNameEC.text,
          lastname: lastNameEC.text,
          phone: user.phone!,
          email: emailEC.text,
          password: passwordEC.text,
          sectors: selectedItens
        );
        _repository.putUser(user.id!, userChanged.toJson()).then(
          (value) {
            Get.back();
            snackSucessRegister('Conta atualizada!', 'Atualização dos dados solicitados realizada');
          }).catchError((error) {
            Get.back();
            tratar(error);
          }
        );
      }
    }
  }

  Future<void> sectoresDialog() {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 8, bottom: 0),
        contentPadding: const EdgeInsets.all(0),
        title: const Center(child: Text('Setores')),
        content: SizedBox(
          width: 300,
          height: Get.height * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: sectors.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Obx(
                          () => Checkbox(
                            value: selectedItens.contains(sectors[index]),
                            onChanged: (value) {
                              value! ? selectedItens.add(sectors[index]) : selectedItens.remove(sectors[index]);
                            }
                          ),
                        ),
                        title: Text('${sectors[index].acronym} - ${sectors[index].name}'),
                      );
                    },
                  ),
                ),
              ),
              TextButton(child: const SizedBox(width: double.infinity, child: Center(child: Text('OK'))), onPressed: () => Get.back())
            ],
          ),
        ),
      ),
    );
  }
}
