import 'package:chamados/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/values/consts.dart';

class AppConfigService extends GetxService {

  late GetStorage box;

  to() => Get.find<AppConfigService>();

  Future<AppConfigService> init() async {
    box = GetStorage();
    await box.writeIfNull(IS_LOGGED, false);
    await box.writeIfNull(DARK_MODE, false);
    await box.writeIfNull(USER_DATA, '');
    return this;
  }

  darkMode() => box.read(DARK_MODE);
  isLogged() => box.read(IS_LOGGED);
  userData() => box.read(USER_DATA);

  changeDarkMode(_) async {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    Get.changeTheme(Get.isDarkMode ? lightTheme : darkTheme);
    await box.write(DARK_MODE, _);
  }

  changeIsLogged(_) async => box.write(IS_LOGGED, _);

  changeUserData(_) async => box.write(USER_DATA, _);
}
