part of home_screen;

class MenuDrawer extends StatelessWidget {

  final UserInfoModel user;

  const MenuDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

  final MenuDrawerController controller = Get.put(MenuDrawerController(logedUser: user.obs));

    return Obx(() =>  Drawer(
      elevation: 5,
      child: Column(
        children: <Widget>[   
          UserAccountsDrawerHeader(
            accountEmail: Text(controller.logedUser.value.email!),
            accountName: Text(controller.logedUser.value.firstName!),
            currentAccountPictureSize: Size(controller.currentAccountPictureSize.value, controller.currentAccountPictureSize.value),
            currentAccountPicture: InkWell(
              onHover: (value) {controller.currentAccountPictureSize.value = value ? 80 : 70;},
              //onTap: () => Get.to(EditUserPage(controller.logedUser.value), routeName: 'edit-user/{controller.logedUser.email!}'),
              child: Tooltip(message: 'Minha Conta', child: CircleAvatar(child: Text(controller.logedUser.value.email!.substring(0,2)),)),
            ),
            otherAccountsPictures: [
              Badge(
                alignment: const Alignment(0, -1.10),
                label: Text('${controller.notificacoes.value}', style: const TextStyle(fontSize: 10),),
                child: cInkWell(30, 35, Icons.notifications_outlined, null, Colors.white, null, 'Notificações', () => print('asdasd'),),
              ),
            ],          
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.message_outlined),
                  title: const Text("Chat"),
                  onTap: () => Get.toNamed(AppRoutes.callCategory),
                ),
                ListTile(
                  title: const Text("Meus Chamados"),
                  leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
                  onTap: () => Get.toNamed(AppRoutes.userCall),
                ),
                Visibility(
                  visible: controller.isAdmin.value,
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
                  onTap: () {
                    controller.clearLocalStorageData();
                    Get.offAllNamed(AppRoutes.login);
                  }
                ),
              ],
            )
          ),
          controller.themeInk.value,  
          addVerticalSpace(10),          
        ],
      ),
    ),);
  }
}
