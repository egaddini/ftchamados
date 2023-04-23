import 'package:chamados/pallete.dart';
import 'package:chamados/services/drawerService.dart';
import 'package:chamados/widgets/c_menu_drawer.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class HomePage extends StatelessWidget {

  DrawerService drawer = DrawerServiceImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Apoio'),
        ),
        backgroundColor: Pallete.gradient3,
      ),
      endDrawer: MenuDrawer(
        accountEmail: "Edder@mail.com",
        accountName: "Edder",
        currentAccountPicture: const CircleAvatar(
          child: Text("ed"),
        ),
        drawerItems: drawer.getDrawerItems(context),
      ),

      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Center(
              child: Container(
                width: 400,
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      'Como podemos ajudar?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),                       
                  ]
                ),
              ),
            ),
          ),
        ),
    );
  }
}
