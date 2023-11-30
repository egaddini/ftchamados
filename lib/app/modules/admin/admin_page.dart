
import 'package:chamados/app/modules/admin/admin_controller.dart';
import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:chamados/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends GetView<AdminController> {
  
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Menu do Administrador'), 
          actions: [
            CInkWell(defaultIcon: Icons.account_circle_outlined, message: 'Minha Conta', function: () => Get.offAllNamed(AppRoutes.login)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CInkWell(defaultIcon: Icons.logout, message: 'Sair', function: () => Get.offAllNamed(AppRoutes.login)),
            ),
          ],
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width < 640 ?
          BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (int index) => controller.setIndex(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'Chamados'),
              BottomNavigationBarItem(icon: Icon(Icons.manage_accounts_outlined), label: 'Usuários'),
            ]
          
        ) : null,
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              onDestinationSelected: (int index) => controller.setIndex(index),
              selectedIndex: controller.selectedIndex.value,
              elevation: 3,
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.receipt_long_outlined), label: Text('Chamados')),
                NavigationRailDestination(icon: Icon(Icons.manage_accounts_outlined), label: Text('Usuários')),
              ],
              labelType: NavigationRailLabelType.all,
              unselectedLabelTextStyle: const TextStyle(),
              useIndicator: true,
            ),
            Expanded(child: controller.screens[controller.selectedIndex.value])
          ],
        ),
      ),
    );
  }
}