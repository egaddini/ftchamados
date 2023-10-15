// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:chamados/app/data/services/app_config/config.dart';
import 'package:get/get_connect/connect.dart';

import '../../../core/utils/helper.dart';
import '../../../core/values/api_path_constans.dart';
import '../models/login_model.dart';

class ChamadosApi extends GetConnect {
  
  login(LoginModel x) async {
    final result = await post(
      ConfigEnvironments.getEnvironments()['url']! + ApiPath.AUTH_PATH,
      jsonEncode(x.toMap()),
      headers: getAuthHeader(),
    );
    return result;
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
