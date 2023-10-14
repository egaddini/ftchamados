import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:chamados/core/theme/theme_manager.dart';

import 'app/data/services/app_config/service.dart';
import 'app/modules/login/auth_repository.dart';
import 'core/languages/locales.g.dart';
import 'routes/app_pages.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => AppConfigService().init());
  Get.put(AuthRepository());

  runApp(GetMaterialApp(
    title: 'Chamados',
    themeMode: ThemeManager().themeMode,
    theme: lightTheme,
    darkTheme: darkTheme,
    initialRoute: AppRoutes.home,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
    scrollBehavior: CustomScrollBehaviour(),
    translationsKeys: AppTranslation.translations,
  ));
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
