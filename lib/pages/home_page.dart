import 'package:chamados/pallete.dart';
import 'package:chamados/repositories/local_repository.dart';
import 'package:chamados/repositories/local_repository_impl.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class HomePage extends StatelessWidget {

  //final LocalRepository localRepo = LocalRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Chamados'),
        ),
        backgroundColor: Pallete.gradient3,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Pallete.gradient3
              ),
              accountEmail: Text("user@mail.com"),
              accountName: Text("Seu zé"),
              currentAccountPicture: CircleAvatar(
                child: Text("SZ"),
              ),

            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
            ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text("Chat"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
            ListTile(
              leading: Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
              title: Text("Meus chamados"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página

              },
            ),
            ListTile(
              leading: Icon(Icons.safety_divider),
              title: Text("Usuarios"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'users');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
          ],
        ),
      ),
    );
  }
}
