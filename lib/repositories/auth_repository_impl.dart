import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:chamados/models/token_model.dart';
import 'package:chamados/models/user_model.dart';
import 'package:chamados/repositories/local_repository.dart';
import 'package:chamados/repositories/local_repository_impl.dart';
import 'package:chamados/repositories/user_repository.dart';
import 'package:chamados/repositories/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:chamados/models/login_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<String> authenticate(LoginModel login) async {

    final LocalRepository localRepo = LocalRepositoryImpl();
    final UserRepository userRepo = UserRepositoryImpl();
    String tokenString = "";

  try {
      final headers = {
        'Content-Type': 'application/json'
        //'Authorization': 'Bearer <seu token>'
      };
      final result = await Dio().post(
      'http://localhost:9092/api/v1/auth/authenticate',
      data: jsonEncode(login.toMap()),
      options: Options(headers: headers)
    );
    if (result.statusCode == 200) {
      final TokenModel token = TokenModel.fromMap(result.data);
      tokenString = localRepo.saveToken(token.token);
      final UserModel user = await userRepo.findByEmail(login.email);
      localRepo.saveUser(user);
    } else {
      log("Erro ao autenticar usuário: código de status ${result.statusCode}");
      throw Exception("Erro ao autenticar usuário: código de status ${result.statusCode}");
    }
  } catch (e) {
    log("Erro na requisição", error: e);
    //throw Exception("Erro na requisição");
  }
  return tokenString;  
  }

}