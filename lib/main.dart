import 'dart:ui';

import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:chamados/core/theme/theme_manager.dart';

import 'app/data/providers/rest_client.dart';
import 'app/data/services/app_config/service.dart';
import 'core/languages/locales.g.dart';
import 'routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => AppConfigService().init());
  RestClient rest = Get.put(RestClient());
  rest.baseUrl = ConfigEnvironments.getEnvironments()['url']!;

  runApp(GetMaterialApp(
    title: 'Chamados',
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ThemeMode.light,
    locale: const Locale('pt', 'BR'),
    initialRoute: AppRoutes.login,
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
