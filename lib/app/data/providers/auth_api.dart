import 'dart:convert';

import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:get/get_connect/connect.dart';

import '../../../core/utils/helper.dart';
import '../models/login_model.dart';

class AuthApi extends GetConnect {
  
  final String basePath = ConfigEnvironments.getEnvironments()['url']!;

  final String authPath = "/authenticate";

  final String registerPath = "/register";

  login(LoginModel x) async {
    final result = await post(
      basePath + authPath,
      jsonEncode(x.toMap()),
      headers: getAuthHeader(),
    );
    return result;
  }

  logout(LoginModel x) async {
    final result = await post(
      basePath + authPath,
      jsonEncode(x.toMap()),
      headers: getAuthHeader(),
    );
    return result;
  }

}
