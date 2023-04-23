// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:chamados/models/user_info_model.dart';
import 'package:chamados/repositories/local_repository.dart';
import 'package:chamados/repositories/local_repository_impl.dart';
import 'package:chamados/repositories/user_repository.dart';
import 'package:chamados/repositories/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:chamados/models/login_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final LocalRepository localRepo = LocalRepositoryImpl();
  final UserRepository userRepo = UserRepositoryImpl();
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
      token = localRepo.saveToken(userInfo.token);
      localRepo.saveUser(userInfo);

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
  void logout() { 
    try {
      final uri = Uri.http('localhost:9090', '/api/v1/authentication/logout');
      final result = Dio().get(
        uri.toString(),
        options: Options(headers: getAuthHeader(true)),
      );
      
    } catch (e) {
      log("Erro na requisição", error: e);
      throw Exception("Erro na requisição");
    }
  }

    Map<String, String> getAuthHeader(bool auth) {
    if (auth) {
      token ??= localRepo.getToken();
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