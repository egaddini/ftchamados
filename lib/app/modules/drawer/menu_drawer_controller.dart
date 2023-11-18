import 'package:chamados/app/modules/call_solver/screen/call_solver_dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/data/services/app_config/service.dart';

import '../../../routes/app_pages.dart';
import '../call_requester/screen/call_requester_dashboard_controller.dart';

class MenuDrawerController extends GetxController with StateMixin<UserInfoModel> {
  late UserInfoModel logedUser;

  RxBool isAdmin = false.obs, isSolver = false.obs;
  RxInt notificacoes = 0.obs;
  RxDouble currentAccountPictureSize = 70.00.obs;

  late AppConfigService _appConfigService;

  @override
  void onInit() {
    _appConfigService = Get.find<AppConfigService>();

    logedUser = _appConfigService.userData();

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

  toMeusChamados() => logedUser.isSolver() ? Get.toNamed(AppRoutes.callSolver)!.then((value) => Get.delete<CallSolverDashboardController>()) : Get.toNamed(AppRoutes.userCall)!.then((value) => Get.delete<CallRequesterDashboardController>());

}
