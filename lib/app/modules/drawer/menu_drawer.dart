import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/modules/call_settings/call_settings_screen.dart';
import 'package:chamados/app/modules/drawer/menu_drawer_controller.dart';
import 'package:chamados/app/modules/user_settings/user_settings_dialog.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/routes/app_pages.dart';

class MenuDrawer extends GetView<MenuDrawerController> {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (logedUser) => Drawer(
        elevation: 5,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(logedUser!.email!),
              accountName: Text(logedUser.firstName!),
              currentAccountPictureSize: Size(controller.currentAccountPictureSize.value, controller.currentAccountPictureSize.value),
              currentAccountPicture: InkWell(
                onHover: (value) => controller.currentAccountPictureSize.value = value ? 80 : 70,
                //onTap: () => Get.to(EditUserPage(controller.logedUser.value), routeName: 'edit-user/{controller.logedUser.email!}'),
                child: Tooltip(
                  message: 'Minha Conta',
                  child: CircleAvatar(
                    child: Text(logedUser.email!.substring(0, 2)),
                  )
                ),
              ),
              otherAccountsPictures: [
                Badge(
                  alignment: const Alignment(0, -1.10),
                  label: Obx(() => Text(
                    '${controller.notificacoes}',
                    style: const TextStyle(fontSize: 10),
                  )),
                  child: CInkWell(
                    defaultIcon: Icons.notifications_outlined, 
                    defaultColor: Colors.white, 
                    message: 'Atualizações', 
                    defaultWidith: 30, 
                    hoverWidith: 35,
                    function: () => controller.readNotifications(),
                  )
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.message_outlined),
                    title: const Text("Chat"),
                    onTap: () => Get.toNamed(AppRoutes.chat),
                  ),
                  ListTile(
                    title: const Text("Meus Chamados"),
                    leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
                    onTap: () => controller.toMeusChamados(),
                  ),
                  Visibility(
                    visible:controller.isSolver.value || controller.isAdmin.value,
                    child: ExpansionTile(
                      title: const Text('Painel do Solucionador'),
                      leading: const Icon(Icons.supervisor_account_outlined),
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 40),
                          title: const Text("Fila de Chamados"),
                          leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
                          onTap: () => Get.toNamed(AppRoutes.call),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 40),
                          title: const Text("Estatísticas"),
                          leading: const Icon(Icons.poll_outlined),
                          onTap: () => Get.toNamed(AppRoutes.callSolverStatistics),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isAdmin.value,
                    child: ExpansionTile(
                      title: const Text('Painel do Administrador'),
                      leading: const Icon(Icons.admin_panel_settings_outlined),
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 40),
                          title: const Text('Chamados'),
                          leading: const Icon(Icons.receipt_long_outlined),
                          onTap: () => callSettingsDialog(),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 40),
                          leading: const Icon(Icons.manage_accounts_outlined),
                          title: const Text("Usuarios"),
                          onTap: () => usersSettingsDialog(),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    onTap: () => Get.offAllNamed(AppRoutes.login),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: controller.setThemeWidget(),
            ),
          ],
        ),
      ),
      onLoading: buildLoadingIndicator(),
      onEmpty: const Text('No data found'),
      onError: (error) => Text(error!),
    );
  }
}
