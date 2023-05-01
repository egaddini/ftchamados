// ignore_for_file: file_names

import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/pages/user/edit_user_page.dart';
import 'package:chamados/app/pages/user/message_response.dart';
import 'package:chamados/app/utils/repositories/auth_repository.dart';
import 'package:chamados/app/utils/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';

abstract class DrawerService {
  List<ListTile> getDrawerItems(BuildContext context, UserInfoModel user);
}

class DrawerServiceImpl implements DrawerService {

  final AuthRepository _authRepo = AuthRepositoryImpl();
  List<ListTile> drawerItems = [];

  @override
  List<ListTile> getDrawerItems(BuildContext context, UserInfoModel user) {
    _getBasicDrawerItems(context, user);
    _getAdminDrawerItems(context);
    _getLogoutDrawerItem(context);
    return drawerItems;
  }

  void _getBasicDrawerItems(BuildContext context, UserInfoModel user) {

    drawerItems.add(ListTile(
      leading: const Icon(Icons.person_outline),
      title: const Text("Minha conta"),
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EditUserPage(user)))
            .then((newContact) {
          if (newContact != null) {
            messageResponse(context, newContact.name + " a sido modificado...!");
            //Logica para alterar usuario logado :D
          }
        });
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
      title: const Text("Chamados"),
      

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
