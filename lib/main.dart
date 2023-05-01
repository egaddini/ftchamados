import 'dart:ui';

import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/pages/home_page.dart';
import 'package:chamados/app/pages/login_page.dart';
import 'package:chamados/app/pages/user/user_page.dart';
import 'package:chamados/app/pages/singup_page.dart';
import 'package:chamados/app/pages/user/user_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chamados',
      theme: ThemeData(primarySwatch: Colors.blue,),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehaviour(),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
  };
}