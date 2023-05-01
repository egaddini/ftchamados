// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/repositories/user_repository_impl.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:chamados/app/models/login_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  LocalStorageServices localStorage = LocalStorageServices();
  final UserRepositoryImpl userRepo = UserRepositoryImpl();
  final String BASE_PATH = "http://localhost:9090/api/v1/auth";
  final String AUTH_PATH = "/authenticate";
  String? token = "";
  
  @override
  Future<String?> authenticate(LoginModel login) async {
  try {
      final headers = {
        'Content-Type': 'application/json'
      };

      final result = await Dio().post(
        "http://localhost:9090/api/v1/auth/authenticate",
        data: jsonEncode(login.toMap()),
        options: Options(headers: headers),
      );
    if (result.statusCode == 200) {

      final UserInfoModel userInfo = UserInfoModel.fromMap(result.data);
      localStorage.saveToken(userInfo.token!);
      //localStorage.saveUser(userInfo);

    } else {
      log("Erro ao autenticar usuário: código de status ${result.statusCode}");
      throw Exception("Erro ao autenticar usuário: código de status ${result.statusCode}");
    }
  } catch (e) {
    log("Erro na requisição", error: e);
  }
  return token;  
  }

 @override
  void logout() async { 
    try {
      final uri = Uri.http('localhost:9090', '/api/v1/authentication/logout');
      final result = Dio().get(
        uri.toString(),
        options: Options(headers: await getAuthHeader(true)),
      );
      
    } catch (e) {
      log("Erro na requisição", error: e);
      throw Exception("Erro na requisição");
    }
  }

    Future<Map<String, String>> getAuthHeader(bool auth) async {
    if (auth) {
      token ??= await localStorage.getToken();
      return {
        'content-type': 'application/json;',
        'authorization': 'Bearer $token'
      };      
    } else {
      return {
        'content-type': 'application/json;',
      };
    }
  }
  
}