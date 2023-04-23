// ignore_for_file: file_names

import 'package:chamados/repositories/auth_repository.dart';
import 'package:chamados/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';

abstract class DrawerService {
  List<ListTile> getDrawerItems(BuildContext context);
}

class DrawerServiceImpl implements DrawerService {

  final AuthRepository _authRepo = AuthRepositoryImpl();
  List<ListTile> drawerItems = [];

  @override
  List<ListTile> getDrawerItems(BuildContext context) {
    _getBasicDrawerItems(context);
    _getAdminDrawerItems(context);
    _getLogoutDrawerItem(context);
    return drawerItems;
  }

  void _getBasicDrawerItems(BuildContext context) {

    drawerItems.add(ListTile(
      leading: const Icon(Icons.person_outline),
      title: const Text("Minha conta"),
      onTap: () {
        Navigator.pop(context);
        //Navegar para outra página
      },
    ));

    drawerItems.add(ListTile(
      leading: const Icon(Icons.message_outlined),
      title: const Text("Chat"),
      onTap: () {
        Navigator.pop(context);
        //Navegar para outra página
      },
    ));

    drawerItems.add(ListTile(
      leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
      title: const Text("Meus chamados"),
      onTap: () {
        Navigator.pop(context);
        //Navegar para outra página
      },
    ));
  }

  void _getAdminDrawerItems(BuildContext context) {
    drawerItems.add(ListTile(
      leading: const Icon(Icons.safety_divider),
      title: const Text("Usuarios"),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, 'users');
      },
    ));
  }

  void _getLogoutDrawerItem(BuildContext context) {
    drawerItems.add(ListTile(
      leading: const Icon(Icons.logout),
      title: const Text("Logout"),
      onTap: () {
        _authRepo.logout();
        Navigator.pushNamed(context, 'login');
      },
    ));
  }

}
