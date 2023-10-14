import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/widgets/custom_ink_well/c_inkwell.dart';

class MenuDrawerController extends GetxController
    with StateMixin<UserInfoModel> {
  late UserInfoModel logedUser;

  RxBool isAdmin = false.obs, isLight = true.obs, isSolver = false.obs;
  RxInt notificacoes = 0.obs;
  RxDouble currentAccountPictureSize = 70.00.obs;

  late Rx<Widget> themeInk = darkModeInk.obs;

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

  late Widget lightModeInk = cInkWell(
    50,
    55,
    Icons.light_mode,
    Icons.light_mode_outlined,
    Get.theme.colorScheme.inversePrimary,
    null,
    'Light Mode',
    () {
      themeInk.value = darkModeInk;
      _appConfigService.changeDarkMode(true);
    },
  );

  late Widget darkModeInk = cInkWell(
    50,
    55,
    Icons.dark_mode,
    Icons.dark_mode_outlined,
    Get.theme.colorScheme.primary,
    null,
    'Dark Mode',
    () {
      themeInk.value = lightModeInk;
      _appConfigService.changeDarkMode(false);
    },
  );

  Widget setThemeWidget() => InkWell(
        borderRadius: BorderRadius.circular(90),
        onHover: (value) {},
        onTap: () =>
            _appConfigService.changeDarkMode(!_appConfigService.darkMode()),
        child: Tooltip(
            message: 'Alterar o Tema',
            child: Icon(
              _appConfigService.darkMode()
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              size: 40,
              fill: 0.5,
            )),
      );
}
