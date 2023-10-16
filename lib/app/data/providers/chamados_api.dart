// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/utils/helper.dart';
import '../../../core/values/api_path_constans.dart';
import '../models/login_model.dart';
import '../services/app_config/service.dart';

class ChamadosApi extends GetConnect {
  
  late AppConfigService config;

  login(LoginModel x) async {
    return await post(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.LOGIN_PATH,
      x.toJson(),
      headers: getAuthHeader(),
    ).then((value) => {
      value.hasError ? null :
        config.changeUserData(value),
        config.changeIsLogged(true),
        Get.offAndToNamed(AppRoutes.home),
    });
  }

  sigin(LoginModel x) async {
    final result = await post(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.REGISTER_PATH,
      jsonEncode(x.toMap()),
      headers: getAuthHeader(),
    );
    return result;
  }
    
}
