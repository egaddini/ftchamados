import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/user/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:chamados/core/utils/helper.dart';
import '../../../data/models/sector_model.dart';
import '../../../data/models/user_info_model.dart';
import '../../../data/models/user_model.dart';

class UserDetailsDialogController extends GetxController with StateMixin<List<dynamic>> {
  
  final UserInfoModel user;


  late UserInfoModel logedUser;
  late TextEditingController idEC, firstNameEC, lastNameEC, emailEC, roleEC;
  final passwordEC = TextEditingController(), confirmPasswordEC = TextEditingController(), senhaAtualEC = TextEditingController();
  final List<String> roles = ['ADMIN', 'USER', 'SOLVER'];
  final passwordKey = GlobalKey<FormState>(), generalKey = GlobalKey<FormState>();
  final UserRepository _userProvider;

  RxBool isAdmin = true.obs;
  final RxList<SectorModel> sectors = <SectorModel>[].obs, selectedItens = <SectorModel>[].obs;
  
  UserDetailsDialogController(this.user, this._userProvider);

  @override
  void onInit() {
    
    logedUser = UserInfoModel.fromJson(AppConfigService().to().userData());
    isAdmin.value = logedUser.isAdmin();

    selectedItens.value = user.sectors!;

    _userProvider.getSectors().then((value) => sectors.value = value.map((json) => SectorModel.fromMap(json)).toList());

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
            sectors: selectedItens);
        _userProvider
            .putUser(user.id!, userChanged.toJson())
            .then((value) => snackSucessRegister('Conta atualizada!', 'Atualização dos dados solicitados realizada'),)
            .catchError((error) {
          Get.back();
          tratarErro(error);
        });
      }
    }
  }
}
