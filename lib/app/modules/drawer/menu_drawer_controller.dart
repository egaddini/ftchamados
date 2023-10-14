import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/data/services/app_config/service.dart';

class MenuDrawerController extends GetxController
    with StateMixin<UserInfoModel> {
  late UserInfoModel logedUser;

  RxBool isAdmin = false.obs, isSolver = false.obs;
  RxInt notificacoes = 0.obs;
  RxDouble currentAccountPictureSize = 70.00.obs;

  late AppConfigService _appConfigService;

  @override
  void onInit() {
    _appConfigService = Get.find<AppConfigService>();

    logedUser = UserInfoModel.fromJson(_appConfigService.userData());

    isAdmin.value = logedUser.isAdmin();
    isSolver.value = logedUser.isSolver();

    change(logedUser, status: RxStatus.success());

    super.onInit();
  }

  Widget setThemeWidget() => InkWell(
        borderRadius: BorderRadius.circular(90),
        onHover: (value) {},
        onTap: () =>_appConfigService.changeDarkMode(!_appConfigService.darkMode()),
        child: Tooltip(
            message: 'Alterar o Tema',
            child: Icon(
              _appConfigService.darkMode()
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              size: 40,
              fill: 0.5,
            )),
      );
}
