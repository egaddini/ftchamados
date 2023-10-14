import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:chamados/app/data/services/app_config/repository.dart';

import '../../../../core/values/consts.dart';
import '../../providers/api.dart';

class AppConfigService extends GetxService {
  late AppConfigRepository repository;
  late GetStorage box;

  Future<AppConfigService> init() async {
    repository = AppConfigRepository(MyApi());
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
    await box.write(DARK_MODE, _);
  }

  changeIsLogged(_) async => box.write(IS_LOGGED, _);

  changeUserData(_) async => box.write(USER_DATA, _);
}
