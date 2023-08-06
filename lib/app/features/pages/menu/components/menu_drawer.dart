part of home_screen;

class MenuDrawer extends StatefulWidget {

  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  
  final MenuDrawerController controller = Get.put(MenuDrawerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Drawer(
      child: controller.isLoading.value? buildLoadingIndicator() : ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(controller.logedUser.email!),
            accountName: Text(controller.logedUser.nome!),
            currentAccountPictureSize: Size(controller.currentAccountPictureSize.value, controller.currentAccountPictureSize.value),
            currentAccountPicture: InkWell(
              onHover: (value) {controller.currentAccountPictureSize.value = value ? 80 : 70;},
              onTap: () => Get.to(EditUserPage(controller.logedUser), routeName: 'edit-user/{controller.logedUser.email!}'),
              child: Tooltip(message: 'Minha Conta', child: CircleAvatar(child: Text(controller.logedUser.email!.substring(0,2)),)),
            ),
            otherAccountsPictures: [
              Badge(
                alignment: const Alignment(0, -1.10),
                label: Text('${controller.notificacoes.value}', style: const TextStyle(fontSize: 10),),
                child: cInkWell(30, 35, Icons.notifications_outlined, null, Colors.white, null, 'Notificações', () {}),
              ),
            ],          
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text("Chat"),
            onTap: () => Get.toNamed(AppRoutes.callType),
          ),
          ListTile(
            title: const Text("Meus Chamados"),
            leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
            onTap: () => Get.toNamed(AppRoutes.userCall),
          ),          
          Visibility(
            visible: controller.isAdmin.value,
            child: ExpansionTile(
              title: const Text('Painel do Administrador'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              children: [
                ExpansionTile(
                  title: const Text('Chamados'),
                  leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
                  children: [                
                    ListTile(
                      title: const Text("Dashboard"),
                      leading: const Icon(Icons.bar_chart_outlined),
                      onTap: () => Get.toNamed(AppRoutes.call),
                    ),
                    ListTile(
                      title: const Text("Categorias"),
                      leading: const Icon(Icons.note_add_outlined),
                      onTap: () => Get.toNamed(AppRoutes.callType),
                    ),                    
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.safety_divider),
                  title: const Text("Usuarios"),
                  onTap: () => Get.toNamed(AppRoutes.users),
                ),              
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => Get.offAndToNamed(AppRoutes.login),
          ),
        ],
      ),
    ),);
  }
}
