import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../data/models/error_dto.dart';
import '../../data/models/login_model.dart';
import '../../data/models/rest_exception.dart';
import '../../data/models/user_info_model.dart';
import '../../data/models/user_model.dart';

// ignore_for_file: non_constant_identifier_names

class AuthRepository {
  final String BASE_PATH = "http://localhost:9090/api/auth/v1";
  final String AUTH_PATH = "/authenticate";
  final String REGISTER_PATH = "/register";

  Future<UserInfoModel> authenticate(LoginModel login) async {
    final result = await Dio().post(
      BASE_PATH + AUTH_PATH,
      data: jsonEncode(login.toMap()),
      options: Options(headers: getAuthHeader()),
    );
    if (result.statusCode == 200) {
      return UserInfoModel.fromMap(result.data);
    } else {
      final ErrorDTO errorDTO = ErrorDTO.fromMap(result.data);
      throw RestException(message: errorDTO.message, statusCode: errorDTO.status);
    }
  }

  Future<String> register(UserModel user) async {
    String message;
    final result = await Dio().post(
      BASE_PATH + REGISTER_PATH,
      data: jsonEncode(user.toMap()),
      options: Options(headers: getAuthHeader()),
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
        options: Options(headers: getAuthHeader()),
      );
    } catch (e) {
      log("Erro na requisição", error: e);
      throw Exception("Erro na requisição");
    }
  }
}
