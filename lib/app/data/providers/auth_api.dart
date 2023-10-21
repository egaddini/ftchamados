import 'dart:convert';

import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:chamados/core/values/api_path_constans.dart';
import 'package:get/get_connect/connect.dart';

import '../../../core/utils/helper.dart';
import '../models/login_model.dart';

class AuthApi extends GetConnect {
  
  final String basePath = ConfigEnvironments.getEnvironments()['url']!;

  final String authPath = "/authenticate";

  final String registerPath = "/register";

  // login(LoginModel x) async {
  //   final result = await post(
  //     basePath + authPath,
  //     jsonEncode(x.toMap()),
  //     headers: getAuthHeader(),
  //   );
  //   return result;
  // }

  void login(LoginModel x) async {
    post(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.LOGIN_PATH,
      x.toJson(),
      headers: getAuthHeader(),
    ).then((value) {
        print(value);
    }, onError: (err) {
      print(err);
    });

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
