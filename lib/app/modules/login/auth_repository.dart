import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../data/models/error_dto.dart';
import '../../data/models/login_model.dart';
import '../../data/models/rest_exception.dart';
import '../../data/models/user_info_model.dart';
import '../../data/models/user_model.dart';
import '../../data/providers/local_storage/local_storage.dart';

// ignore_for_file: non_constant_identifier_names

class AuthRepository {
  final String BASE_PATH = "http://localhost:9090/api/v1/auth";
  final String AUTH_PATH = "/authenticate";
  final String REGISTER_PATH = "/register";

  Future<void> authenticate(LoginModel login) async {
    final result = await Dio().post(
      BASE_PATH + AUTH_PATH,
      data: jsonEncode(login.toMap()),
      options: Options(headers: await getAuthHeader(false)),
    );
    if (result.statusCode == 200) {
      LocalStorageServices localStorage = LocalStorageServices();
      final UserInfoModel userInfo = UserInfoModel.fromMap(result.data);
      await localStorage.saveUser(userInfo);
      await localStorage.saveToken(userInfo.token.toString());
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(result.data);
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
    }
  }

  Future<String> register(UserModel user) async {
    String message;
    final result = await Dio().post(
      BASE_PATH + REGISTER_PATH,
      data: jsonEncode(user.toMap()),
      options: Options(headers: await getAuthHeader(false)),
    );
    if (result.statusCode == 200) {
      message = result.statusMessage!;
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(result.data);
      throw RestException(
          message: errorDTO.message, statusCode: errorDTO.status);
    }
    return message;
  }

  void logout() async {
    try {
      final uri = Uri.http('localhost:9090', '/api/v1/authentication/logout');
      Dio().get(
        uri.toString(),
        options: Options(headers: await getAuthHeader(true)),
      );
    } catch (e) {
      log("Erro na requisição", error: e);
      throw Exception("Erro na requisição");
    }
  }
}
