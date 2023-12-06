// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/user_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/call_solver/screen/call_solver_dashboard_controller.dart';
import 'package:chamados/app/modules/drawer/drawer_repository.dart';

import '../../../core/utils/helper.dart';
import '../../../routes/app_pages.dart';
import '../call_requester/screen/call_requester_dashboard_controller.dart';

class MenuDrawerController extends GetxController with StateMixin<UserInfoModel> {
  
  late UserInfoModel logedUser;

  RxBool isAdmin = false.obs, isSolver = false.obs;
  RxInt notificacoes = 0.obs;
  RxDouble currentAccountPictureSize = 70.00.obs;

  late AppConfigService _appConfigService;

  final DrawerRepository _repository;

  MenuDrawerController(this._repository);

  List<UserNotification> ureandNotifications = [];

  @override
  void onInit() {
    _appConfigService = Get.find<AppConfigService>();

    logedUser = _appConfigService.userData();

    isAdmin.value = logedUser.isAdmin();
    isSolver.value = logedUser.isSolver();

    notificacoes.value = logedUser.notifications.length;

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

  findNewNotifications() {
    _repository.findNotifications(logedUser.id!).then(
      (value) => {
        ureandNotifications = value.where((x) => !x.isRead!).toList(),
        notificacoes.value = value.length,
      }
    );
  }

  readNotifications() {
    showDialog(
      context: Get.context!, 
      builder: (value) => AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Atualizações', style: Get.textTheme.titleLarge),
            // TextButton(child: const Text('Todas Lidas'), onPressed: () => Get.back())
          ],
        ),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                itemCount: ureandNotifications.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(title: Text('${ureandNotifications[index].message}', maxLines: 1, overflow: TextOverflow.ellipsis));
                },
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.all(0),
        actions: [
          TextButton(
            child: const SizedBox(
              width: double.infinity, 
              child: Center(
                child: Text('OK')
              )
            ), 
            onPressed: () => {
              _repository.readNotifications(logedUser.id!).then(
                (value) => {
                  ureandNotifications = [],
                  notificacoes.value = 0,
                  Get.back(),
                  snackSucessRegister('Notificações lidas', ''),
                }
              ),
            }
          ),
        ],
      ),
    );
  }

}
