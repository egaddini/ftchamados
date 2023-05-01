import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/services/drawer_service.dart';
import 'package:chamados/app/services/user_service.dart';
import 'package:chamados/app/shared_components/c_menu_drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DrawerService drawer = DrawerServiceImpl();

  UserService userSvc = UserServiceImpl();

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
        drawerItems: drawer.getDrawerItems(context, userSvc.getLogedUserInfo(context)),
      ),

      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                      SizedBox(height: 60),
                      Text(
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
