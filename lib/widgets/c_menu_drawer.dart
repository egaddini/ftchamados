// ignore_for_file: file_names

import 'package:chamados/pallete.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final List<Widget> drawerItems;
  final String accountEmail;
  final String accountName;
  final Widget currentAccountPicture;

  const MenuDrawer({
    Key? key,
    required this.drawerItems,
    required this.accountEmail,
    required this.accountName,
    required this.currentAccountPicture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Pallete.gradient3
            ),
            accountEmail: Text(accountEmail),
            accountName: Text(accountName),
            currentAccountPicture: currentAccountPicture,
          ),
          ...drawerItems,
        ],
      ),
    );
  }
}
