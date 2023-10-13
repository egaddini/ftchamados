import 'dart:convert';

import 'package:get/get_connect/connect.dart';

import '../../../core/utils/helper.dart';
import '../models/login_model.dart';

class MyApi extends GetConnect {
  final String authUri = "http://localhost:9090/api/v1/auth";
  final String authPath = "/authenticate";
  final String registerPath = "/register";

  login(LoginModel _) async {
    final result = await post(
      authUri + authPath,
      jsonEncode(_.toMap()),
      headers: await getAuthHeader(false),
    );
    return result;
  }
}
