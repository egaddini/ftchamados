import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

import 'package:chamados/core/theme/theme_manager.dart';

import 'core/languages/locales.g.dart';
import 'routes/app_pages.dart';

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
      themeMode: ThemeManager().themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehaviour(),
      translationsKeys: AppTranslation.translations,
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
