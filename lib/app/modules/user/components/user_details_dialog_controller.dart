import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../../../routes/app_pages.dart';
import '../../../data/models/sector_model.dart';
import '../../../data/models/user_info_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/providers/local_storage/local_storage.dart';
import 'user_details_dialog_provider.dart';

class UserDetailsDialogController extends GetxController
    with StateMixin<List<dynamic>> {
  final UserInfoModel user;

  UserDetailsDialogController(this.user);

  late UserInfoModel logedUser;
  late TextEditingController idEC, firstNameEC, lastNameEC, emailEC, roleEC;
  final passwordEC = TextEditingController(),
      confirmPasswordEC = TextEditingController(),
      senhaAtualEC = TextEditingController();
  final List<String> roles = ['ADMIN', 'USER', 'SOLVER'];
  final passwordKey = GlobalKey<FormState>(),
      generalKey = GlobalKey<FormState>();
  final UserDetailsDialogProvider _userProvider = UserDetailsDialogProvider();

  RxBool isLoading = true.obs, isAdmin = false.obs;
  final RxList<SectorModel> sectors = <SectorModel>[].obs,
      selectedItens = <SectorModel>[].obs;

  @override
  void onInit() {
    LocalStorageServices().getUser().then((value) {
      if (value != null) {
        logedUser = value;
        isAdmin.value = value.isAdmin();
        selectedItens.value = user.sectors;
      } else {
        Get.offAndToNamed(AppRoutes.login);
        snackSucessRegister('Algo de errado aconteceu',
            'se persistir entre em contato com o apoio');
      }
    });

    // _userProvider.getSectors().then((value) => sectors = value.cas?t<String>());
    _userProvider.getSectors().then((value) => sectors.value =
        value.map((json) => SectorModel.fromMap(json)).toList());

    idEC = TextEditingController(text: user.id.toString());
    firstNameEC = TextEditingController(text: user.firstName);
    lastNameEC = TextEditingController(text: user.lastName);
    emailEC = TextEditingController(text: user.email);
    roleEC = TextEditingController(text: user.role);

    isLoading.value = false;
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
            .then(
              (value) => snackSucessRegister('Conta atualizada!',
                  'Atualização dos dados solicitados realizada'),
            )
            .catchError((error) {
          Get.back();
          tratarErro(error);
        });
      }
    }
  }
}
